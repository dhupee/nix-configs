{
  description = "Combined Nix-on-Droid and Home Manager config.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-on-droid, home-manager }:
    let
      system = "x86_64-linux"; # Adjust this if you are using a different architecture
      pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;
    in {

    # Nix-on-Droid configuration
    nixOnDroidConfigurations = {
      default = nix-on-droid.lib.nixOnDroidConfiguration {
        pkgs = import nixpkgs { system = "aarch64-linux"; };
        modules = [ ./droids/default.nix ];
      };
    };

    # NixOS configuration
    nixosConfigurations = {
      nitro = lib.nixosSystem {
        inherit system;
        modules = [ ./desktop/nitro/configuration.nix ];
      };
    };

    # Home Manager configuration
    homeConfigurations = {
      dhupee = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./home/dhupee.nix ];
      };
    };
  };
}

