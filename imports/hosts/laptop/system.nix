
{ config, pkgs, ... }:

let
  commonSystem = ../../common/system;
in
{
  imports = [
    "${commonSystem}/hardware-configuration.nix"
    "${commonSystem}/app/cli/ssh"
    "${commonSystem}/nix"
    "${commonSystem}/os/boot/bootloader"
    "${commonSystem}/os/locale"
    "${commonSystem}/os/networking"
    "${commonSystem}/os/printing"
    "${commonSystem}/style/stylix"
    "${commonSystem}/user/user.nix"
    "${commonSystem}/wm/pipewire"
  ];
}
