{ config, pkgs, lib, settings, ... }:

{
  programs.home-manager.enable = true;

  home = {
    username = settings.username;
    homeDirectory = "/home/${settings.username}";

    stateVersion = "24.05";

    file = { };

    sessionVariables = { };

    # xsession.enable = true;
    # xsession.windowManager.command = "…";
  };
}
