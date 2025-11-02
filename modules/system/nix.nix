{config, pkgs, ... }:

{ 
  nixpkgs.config.allowUnfree = true;

  xdg.portal = {
	  enable = true;
	};

  services.flatpak.enable = true;
  services.gnome.gnome-keyring.enable = true;

  environment.systemPackages = with pkgs; [ xorg.libXdamage ];

  system.stateVersion = "24.05";

  nix = { 
    settings = {
      experimental-features = [ 
        "nix-command" 
        "flakes" 
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  boot.loader.grub.configurationLimit = 5;
}
