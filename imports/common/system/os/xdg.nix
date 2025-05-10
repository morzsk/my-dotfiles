{ config, pkgs, ... }:

{
	xdg.portal = {
	  enable = true;                                  # turn the service on
	  extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; # backend that provides OpenURI & Settings
      config.common.default = "gtk";                  # make GTK the default portal
	};
}
