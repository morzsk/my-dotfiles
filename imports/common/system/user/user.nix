{ config, pkgs, lib, settings, ... }:

{
  users.users.${settings.username} = {
    isNormalUser = true;
    description = settings.description;
    home = "/home/${settings.username}";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
