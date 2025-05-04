{ config, pkgs, ... }:

let
  config = import ./config.nix;
in
{
  home.packages = with pkgs; [
    gnomeExtensions.space-bar
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [ 
        "space-bar@luchrioh" 
      ];
    };
    "org/gnome/shell/extensions" = config;
  };
}