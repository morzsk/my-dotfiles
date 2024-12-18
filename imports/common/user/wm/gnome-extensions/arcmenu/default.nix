{ config, pkgs, ... }:

let
  config = import ./config.nix;
in
{
  home.packages = with pkgs; [
    gnome-menus
    gnomeExtensions.arcmenu
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [ 
        "arcmenu@arcmenu.com"
      ];
    };
    "org/gnome/shell/extensions/arcmenu" = config;
  };
}
