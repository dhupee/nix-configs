{ pkgs, ...}:

{
  programs.git = {
    enable = true;
    lfs = {
      enable = true;
    extraConfig = {
        user.name = "Daffa Haj Tsaqif";
        user.email = "narutohaj00@gmail.com";
      };
    };
  };
}
