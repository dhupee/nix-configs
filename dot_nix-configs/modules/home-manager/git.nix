{ pkgs, ...}:

{
  programs.git = {
    enable = true;
    userName = "Daffa Haj Tsaqif";
    userEmail = "narutohaj00@gmail.com";
    lfs = {
      enable = true;
    # extraConfig = {
    #     ''
    #     [credential "https://github.com"]
    #             helper = !$(which gh) auth git-credential
    #     [credential "https://gist.github.com"]
    #             helper = !$(which gh) auth git-credential
    #     ''
    #   };
    };
  };
}
