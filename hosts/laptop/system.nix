{ config, pkgs, ... }:

let
  modules = ../../modules/system;
in
{
  networking.hostName = "laptop";
  programs.zsh.enable = true;

  users.users.mo = {
    isNormalUser = true;
    description = "mo";
    home = "/home/mo";
    extraGroups = [ "networkmanager" "wheel" "plugdev" ];
    shell = pkgs.zsh;
  };

  # imports = [
  # ];
}
