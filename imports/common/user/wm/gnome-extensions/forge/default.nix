{ config, pkgs, ... }:

let 
  config = import ./config.nix;
in
{
  home.packages = with pkgs; [
    gnomeExtensions.forge
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [ 
        "forge@jmmaranan.com"
      ];
    };
    "org/gnome/shell/extensions/forge" = config;
  };
}