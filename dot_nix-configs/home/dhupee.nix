{ config, pkgs, ... }:

{
  imports = [
    ../modules/home-manager/zsh.nix
    ../modules/home-manager/starship.nix
    ../modules/home-manager/neovim.nix
    ../modules/home-manager/git.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "dhupee";
  home.homeDirectory = "/home/dhupee";

  # Don't change this without reading the docs.
  home.stateVersion = "24.05";

  # Packages
  home.packages = with pkgs; [
    alacritty
    fastfetch
    lazygit
    gh
    podman

    # Fonts
    (pkgs.nerdfonts.override { fonts = [ "Hack Nerd Font" ]; })

    # Shell scripts
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Config that needs to be symlinked
  home.file = {
    ".aliases".source = ./aliases;
    ".config/PrusaSlicer".source = ../config/PrusaSlicer;
    ".config/containers".source = ../config/containers;
    ".tmux.conf".source = ../config/tmux.conf;
  };

  # Session variables
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
