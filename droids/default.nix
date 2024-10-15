{ config, lib, pkgs, ... }:

{
  # Simply install just the packages
  environment.packages = with pkgs; [
    # User-facing stuff that you really really want to have
    # Make sure its CLI only
    # Check the modules to prevent duplicate installs
    bat
    # coreutils
    curl
    # corefonts
    fastfetch
    fzf
    git
    lazygit
    man
    nano
    tldr
    tmate
    # toybox
    vim
    wget
    yt-dlp
  ];


  # Home-manager specific configuration
  home-manager.config = {
    # Don't change this willy nilly
    home.stateVersion = "24.05";

    # Importing any modules from Home.nix goes through here
    imports = [ # has issue for being bit heavy, dont used it for now
      ../modules/zsh-droid.nix
      ../modules/helix.nix
    ];

    home.file = {
    # Symlink config files you want, example:
    # ".screenrc".source = dotfiles/screenrc;

    # ".p10k.zsh".source = ../config/p10k.zsh;
    ".config/ohmyposh".source = ../config/ohmyposh-droid;
    ".aliases".source = ../aliases;
    ".tmate.conf".source = ../config/tmate.conf;
    };
  };

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Android/Termux specific configuration
  android-integration = {
    # to make sure I have access to phone's storage system
    termux-setup-storage.enable = true;
  };

  user.shell = "${pkgs.zsh}/bin/zsh";

  # Read the changelog before changing this value
  system.stateVersion = "24.05";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Set your time zone
  time.timeZone = "Asia/Jakarta";
}
