{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zsh
    oh-my-zsh
  ];

  home.file.".oh-my-zsh/custom/themes/mytheme.zsh-theme".text = ''
    PROMPT='%F{cyan}%n@%m %F{yellow}%~ %F{green}$(git_prompt_info)%f$ '
    ZSH_THEME_GIT_PROMPT_INFO_PREFIX="(%F{red}"
    ZSH_THEME_GIT_PROMPT_INFO_SUFFIX="%f) "
  '';
  
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
