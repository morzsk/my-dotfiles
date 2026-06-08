{ lib, constants, ... }:

let
  modules = constants.paths.modules.user;
in
{
  programs.home-manager.enable = true;

  home = {
    username = constants.user.name;
    homeDirectory = constants.user.home;
    stateVersion = constants.stateVersion;
    file = lib.mapAttrs' (name: path: {
      name = lib.removePrefix (constants.user.home + "/") path + "/.keep";
      value = {
        text = "";
      };
    }) constants.dirs;
    sessionVariables = { };
  };

  imports = [
    (modules + /apps)
    (modules + /apps/pc.nix)
    (modules + /git)
    (modules + /zsh)
    (modules + /hyprland)
    (modules + /stylix)
    (modules + /gtk)
    (modules + /rofi)
    (modules + /yazi)
    (modules + /terminal)
    (modules + /fastfetch)
    (modules + /btop)
    (modules + /fzf)
    (modules + /nvchad)
    (modules + /kitty)
    (modules + /flatpak)
    (modules + /brave)
    (modules + /obsidian)
    (modules + /vscode)
    (modules + /opencode)
    (modules + /claude)
    (modules + /awww)
    (modules + /obs)
    (modules + /gpu-screen-recorder)
  ];
}
