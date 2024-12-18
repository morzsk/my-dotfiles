{ config, pkgs, lib, ... }:

{
  users.users.mo = {
    isNormalUser = true;
    description = "mo";
    home = "/home/mo";
    extraGroups = [ "networkmanager" "wheel" ];
  };
}
