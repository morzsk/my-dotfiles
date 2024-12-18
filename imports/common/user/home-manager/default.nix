{ config, pkgs, lib, ... }:

{
  programs.home-manager.enable = true;

  home = {
    username = "mo";
    homeDirectory = "/home/mo";

    stateVersion = "24.05";

    file = { };

    sessionVariables = { };

    # xsession.enable = true;
    # xsession.windowManager.command = "…";
  };
}
