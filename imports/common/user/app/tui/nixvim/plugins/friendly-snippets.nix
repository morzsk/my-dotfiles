{ config, pkgs, ... }:

{
  programs.nixvim.plugins.friendly-snippets = {
    enable = true;
  };
}