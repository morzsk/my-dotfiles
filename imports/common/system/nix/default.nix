
{config, pkgs, ... }:

{ 
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ xorg.libXdamage ];

  system.stateVersion = "24.05";

  nix = { 
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      
      # substituters = [
      #   "https://cache.nixos.org"
      #   "https://app.cachix.org/cache/nix-community"
      # ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  boot.loader.grub.configurationLimit = 5;
}
