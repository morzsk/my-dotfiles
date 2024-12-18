{ config, pkgs, ... }:

{
  userConfig = {
    username = "mo";
    homeDirectory = "/home/mo";
    isNormalUser = true;
    description = "mo";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
