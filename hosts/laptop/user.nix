{ constants, ... }:

let
  modules = constants.paths.modules.user;
in
{
  programs.home-manager.enable = true;

  home = {
    username = constants.user.name;
    homeDirectory = constants.user.home;

    stateVersion = constants.stateVersion;

    file = { };
    sessionVariables = { };
  };

  imports = [
    (modules + /apps)
    (modules + /apps/top.nix)
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
