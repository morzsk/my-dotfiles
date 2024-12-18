{ config, pkgs, ... }:

{
  imports = [
    ./arcmenu
    ./dash-to-panel
    ./forge
    ./just-perfection
    ./space-bar
    ./vitals
  ];
}
