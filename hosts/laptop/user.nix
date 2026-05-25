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
    (modules + /apps)
    (modules + /git)
    (modules + /zsh)
    (modules + /hyprland)
    (modules + /stylix)
    (modules + /gtk)
    (modules + /rofi)
    (modules + /yazi)
    (modules + /zoxide)
    (modules + /nvchad)
    (modules + /kitty)
    (modules + /flatpak)
    (modules + /brave)
    (modules + /obsidian)
    (modules + /vscode)
    (modules + /opencode)
    (modules + /claude)
    (modules + /awww)
  ];
}
