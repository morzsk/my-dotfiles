{ config, pkgs, ... }:

let
  modules = ../../modules/user;
in
{
  programs.home-manager.enable = true;

  home = {
    username = "mo";
    homeDirectory = "/home/mo";

    stateVersion = "24.05";

    file = { };
    sessionVariables = { };
  };

  imports = [
    (modules + /git)
    (modules + /zsh)
    (modules + /utils)
    (modules + /hyprland)
    (modules + /stylix)
    (modules + /gtk)
    (modules + /rofi)
    (modules + /yazi)
    (modules + /kitty)
    (modules + /flatpak)
    (modules + /apps)
    (modules + /brave)
    (modules + /obsidian)
    (modules + /vscode)
    (modules + /steam)
  ];
}
