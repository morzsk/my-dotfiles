{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;

    shellAliases = {
      nupdate = "sudo nixos-rebuild switch --flake ~/.dotfiles";
      hupdate = "home-manager switch --flake ~/.dotfiles";
      ls = "lsd";
    };
  };
}
