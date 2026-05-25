{ pkgs, ... }:

let
  wallpaper-shuffle = pkgs.writeShellScriptBin "wallpaper-shuffle" ''
    WALLPAPER_DIR="${./wallpapers}"
    ${builtins.readFile ./wallpaper-shuffle.sh}
  '';
in
{
  services.awww.enable = true;
  home.packages = [ wallpaper-shuffle ];
}
