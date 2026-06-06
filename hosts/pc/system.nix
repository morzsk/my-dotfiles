{ pkgs, constants, ... }:

let
  modules = constants.paths.modules.system;
in
{
  networking.hostName = constants.hosts.pc;
  programs.zsh.enable = true;

  users.users.${constants.user.name} = {
    isNormalUser = true;
    description = constants.user.name;
    home = constants.user.home;
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
    (modules + /obs)
    (modules + /brave)
  ];
}
