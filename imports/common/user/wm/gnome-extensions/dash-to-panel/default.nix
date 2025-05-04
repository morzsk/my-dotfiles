{ config, pkgs, ... }:

let
  config = import ./config.nix;
in
{
  home.packages = with pkgs; [
    gnomeExtensions.dash-to-panel
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [ 
        "dash-to-panel@jderose9.github.com" 
      ];
    };
    "org/gnome/shell/extensions/dash-to-panel" = config;
  };
}