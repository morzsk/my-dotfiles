{ config, pkgs, ... }:

let
  commonSystem = ../../common/system;
in
{
  imports = [
    "${commonSystem}/hardware-configuration.nix"
    "${commonSystem}/app/ssh.nix"
    "${commonSystem}/hardware/nvidia.nix"
    "${commonSystem}/os/nix.nix"
    "${commonSystem}/os/bootloader.nix"
    "${commonSystem}/os/locale.nix"
    "${commonSystem}/os/networking.nix"
    "${commonSystem}/os/printer.nix"
    "${commonSystem}/os/user.nix"
    "${commonSystem}/style/stylix.nix"
	# "${commonSystem}/wm/gnome"
	"${commonSystem}/wm/ly.nix"
    "${commonSystem}/wm/pipewire.nix"
  ];
}
