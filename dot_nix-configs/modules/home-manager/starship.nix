{pkgs, ...}:

{
  programs = {
    starship = {
      enable = true;
      enableZshIntegration = true;
      presets = ["bracketed-segments"];
    };
  };
}
