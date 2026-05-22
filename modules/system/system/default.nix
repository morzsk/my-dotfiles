{ ... }:

{
  # bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # graphics
  hardware.graphics.enable = true;
	hardware.opengl.enable = true;
}
