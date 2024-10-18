{config, pkgs, ...}:

{
  users.users.dhupee = {
    isNormalUser = true;
    description = "dhupee";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      kate
    #  thunderbird
    ];
  };
}
