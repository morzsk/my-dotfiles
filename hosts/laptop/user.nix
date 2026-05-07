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

  # imports = [
  # ];
  
  # home.packages = [
  # ];
}
