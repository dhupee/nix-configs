# Dhupee's Nix Dotfiles (EXPERIMENTAL)

This is my dotfiles that I currently created on my Nix dotfiles, not only for NixOS, but also for Android, and maybe hopefully servers and Macs if i have money.

It's still experimental, since I havent move to NixOS yet, but it should be good enough for now.

<!--toc:start-->

- [Dhupee's Nix Dotfiles (EXPERIMENTAL)](#dhupees-nix-dotfiles-experimental)
  - [File Structure](#file-structure)
  - [Installation](#installation)
  - [To-Do List](#to-do-list)
  <!--toc:end-->

## File Structure

This is how I structure my dotfiles currently, it might will have few directories, maybe regarding theming, users, or something else in the future.

```txt
.
├── aliases             # Bunch of my Aliases
├── config              # Non-nix configuration files
│   ├── alacritty
│   ├── helix
│   └── ohmyposh-droid
├── desktop             # Systems configuration.nix files
│   └── nitro
├── droids              # Nix on Droid configuration.nix files
├── home                # Home-manager nix files
├── machines            # hardware-configuration.nix files, mostly for backups
│   └── virt-manager-vm
└── modules             # modules, to make it neat
    └── home-manager
```

## Installation

TBA

## To-Do List

[] Make a command and control like for managing nix, built in go, name Yuki
[] Either specific nix for centralized configuration, or maybe on the flake
