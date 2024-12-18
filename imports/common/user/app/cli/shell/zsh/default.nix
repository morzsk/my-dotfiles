{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zsh
    oh-my-zsh
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "robbyrussell";
    };

    shellAliases = {
      nupdate = "sudo nixos-rebuild switch --flake ~/.dotfiles";
      hupdate = "home-manager switch --flake ~/.dotfiles";
      ls = "lsd";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
