{ pkgs, ... }:

let
  wallpaper-shuffle = pkgs.writeShellScriptBin "wallpaper-shuffle"
    (builtins.readFile ./wallpaper-shuffle.sh);
in
{
  services.awww.enable = true;
  home.packages = [ wallpaper-shuffle ];
}
