{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true; # Enable the X11 windowing system.
      
    # Enable the GNOME Desktop Environment.
	displayManager.gdm.enable = true;
	
	# displayManager.lightdm.enable = true;

	#displayManager.lightdm = {
	#  enable = true;
	#  greeter.enable = true;
	#  greeters.gtk.enable = true;
	#  greeters.gtk.theme.name = "Adwaita";
	#};

	desktopManager.gnome.enable = true;

    # Configure keymap in X11
    xkb = {
      layout = "gb";
      variant = "";
    };
  };

	#security.polkit.enable = true;

   # Configure console keymap
   console.keyMap = "uk";
}
