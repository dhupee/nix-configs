{ config, lib, pkgs, ... }:

{

  # Simply install just the packages
  environment.packages = with pkgs; [
    # User-facing stuff that you really really want to have
    # Make sure its CLI only
    bat
    fastfetch
    git
    man
    nano
    tldr
    tmate
    vim
    yt-dlp
  ];

  home-manager.config = {

    imports = [
     ./modules/zsh.nix
    ];

    home.file = {
    # Symlink config files you want, example:
    # ".screenrc".source = dotfiles/screenrc;

    ".p10k.zsh".source = ./config/p10k.zsh;
    ".aliases".source = ./aliases;
    };
  };

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  android-integration = {
    termux-setup-storage.enable = true; 
  };

  # Read the changelog before changing this value
  system.stateVersion = "24.05";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Set your time zone
  #time.timeZone = "Europe/Berlin";
}
