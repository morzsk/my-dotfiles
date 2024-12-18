{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gnomeExtensions.just-perfection
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [ 
        "just-perfection-desktop@just-perfection" 
      ];
    };
    # "org/gnome/shell/extensions/" = {

    # }
  };
}