{ pkgs, ... }:

let
  modules = ../../modules/system;
in
{
  networking.hostName = "pc";
  programs.zsh.enable = true;

  users.users.mo = {
    isNormalUser = true;
    description = "mo";
    home = "/home/mo";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  imports = [
    (modules + /system)
    (modules + /nvidia)
    (modules + /networking)
    (modules + /tailscale)
    (modules + /pipewire)
    (modules + /nix)
    (modules + /stylix)
    (modules + /wine)
    (modules + /ly)
    (modules + /steam)
  ];
}
