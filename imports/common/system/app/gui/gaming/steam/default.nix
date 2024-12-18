{ config, pkgs, ... }:

{
  programs.steam = {
    enable = true;
	# gamescopeSession.enable = true;
  };

  programs.gamemode.enable = true;

  environment.systemPackages = [ 
    pkgs.steam
    pkgs.protonup
    ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATH = "home/user/.steam/root/compatibilitytools.d";
  };
}
