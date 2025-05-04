{ config, pkgs, ... }:

let
  commonSystem = ../../common/system;
in
{
  imports = [
    "${commonSystem}/hardware-configuration.nix"
    "${commonSystem}/app/cli/ssh"
    "${commonSystem}/hardware/nvidia"
    "${commonSystem}/nix"
    "${commonSystem}/os/boot/bootloader"
	#"${commonSystem}/os/boot/kernel"
    "${commonSystem}/os/locale"
    "${commonSystem}/os/networking"
    "${commonSystem}/os/printing"
    "${commonSystem}/style/stylix"
    "${commonSystem}/user/user.nix"
	"${commonSystem}/wm/gnome"
	#"${commonSystem}/wm/ly"
    "${commonSystem}/wm/pipewire"
  ];
}
