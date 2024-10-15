{ config, pkgs, ... }:

{

    # supporting packages needed for zsh
    home.packages = with pkgs; [
      hack-font
    ];

    programs = {
      zsh = {
        enable = true;
        initExtra = ''
          # Sourcing aliases
            if [ -d ~/.aliases/ ]; then
                # Loop through all .sh files in the aliases directory and source them
                for file in ~/.aliases/*.sh; do
                    if [ -f "$file" ]; then
                        source "$file"
                    fi
                done
            else
                echo "Aliases directory not found"
            fi

            '';
        # initExtra = "source ~/.p10k.zsh";
        oh-my-zsh = {
            enable = true;
            # theme = "robbyrussell";
            plugins = [
                "thefuck"
                "copypath"
                "docker"
                "podman"
                "qrcode"
                "nvm"
                "node"
                "npm"
                "pyenv"
                "python"
                "golang"
                "zoxide"
            ];
        };
    };

    oh-my-posh = {
      enable = true;
      package = pkgs.oh-my-posh;
      enableZshIntegration = true;
      useTheme = "onehalf.minimal";
    };
  };
}
