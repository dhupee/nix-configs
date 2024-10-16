{ config, pkgs, ... }:

{
    # supporting packages needed for zsh
    # home.packages = with pkgs; [
    #   hack-font
    # ];

    programs = {
      zsh = {
        enable = true;
        enableCompletion = false; # make sure it uses the zsh-autocomplete instead
        initExtra = ''

          source ${pkgs.zsh-autocomplete}/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

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
        oh-my-zsh = {
            enable = true;
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
      syntaxHighlighting = {
        enable = true;
      };
    };

    # use oh-my-posh instead for the prompt
    oh-my-posh = {
      enable = true;
      package = pkgs.oh-my-posh;
      enableZshIntegration = true;
      useTheme = "onehalf.minimal"; # minimal theme dont need nerd font
    };
  };
}
