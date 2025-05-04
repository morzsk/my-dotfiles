{ config, pkgs, ... }:

let
  cfg = import ./config.nix;
  theme = builtins.readFile ./gruvbox_amoled.json;
in
{
  home.packages = with pkgs; [ 
    blackbox-terminal
  ];

  dconf.settings = {
    "com/raggesilver/BlackBox" = cfg;
  };

  home.file.".local/share/blackbox/schemes/gruvbox_amoled.json".text = theme; 
}
