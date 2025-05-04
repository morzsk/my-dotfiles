{ config, pkgs, ... }:

let
  config = import ./config.nix;
in
{
  home.packages = with pkgs; [
    gnomeExtensions.vitals
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [ 
        "Vitals@CoreCoding.com"
      ];
    };
    "org/gnome/shell/extensions/vitals" = config;
  };
}