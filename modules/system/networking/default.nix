{ config, pkgs, ... }:

{
  networking = {
		networkmanager.enable = true;
		firewall = {
			enable = true;
			allowedTCPPorts = [
				1234
			];
			allowedUDPPorts = [
				1194
				1234
			];
			trustedInterfaces = [
				"tun0"
				"tailscale0"
			];
		};
	};

	hardware.bluetooth.enable = true;
	services.blueman.enable = true;
}
