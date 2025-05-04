{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    ripgrep
    tree
  ];

  programs.git = {
    enable = true;
    userName = "mo";
    userEmail = "morzsk@pm.me";

    aliases = {
      ci = "commit";
      co = "checkout";
      s = "status";
    };
  };
}
