{ pkgs, constants, ... }:

let
  modules = constants.paths.modules.system;
in
{
  networking.hostName = constants.hosts.laptop;
  programs.zsh.enable = true;

  users.users.${constants.user.name} = {
    isNormalUser = true;
    description = constants.user.name;
    home = constants.user.home;
    extraGroups = [ "networkmanager" "wheel" "plugdev" ];
    shell = pkgs.zsh;
  };

  imports = [
    (modules + /system)
    (modules + /networking)
    (modules + /tailscale)
    (modules + /pipewire)
    (modules + /nix)
    (modules + /stylix)
    (modules + /wine)
    (modules + /ly)
  ];
}
