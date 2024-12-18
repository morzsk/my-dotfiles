{ config, pkgs, ... }:

let
  commonUser = ../../common/user;
in
{
  imports = [
    "${commonUser}/app/cli/git"
    "${commonUser}/app/cli/shell/bash"
    "${commonUser}/app/cli/shell/zsh"
    "${commonUser}/app/gui/browser/brave"
    "${commonUser}/app/gui/terminal/blackbox"
    "${commonUser}/app/tui/nixvim"
    "${commonUser}/home-manager"
    "${commonUser}/style/gtk"
    "${commonUser}/style/stylix"
	"${commonUser}/wm/gnome-extensions"
  ];

  home.packages = with pkgs; [
    bat
    btop
    lsd
    macchina
    neofetch
    ripgrep
    tree
    thefuck
    nix-search-cli
    nix-prefetch-git
    whatsapp-for-linux
	prismlauncher
    amberol
    dconf-editor
    tagger
    calibre
	helvum
	obsidian
	obs-studio
    youtube-music
	rclone
		# davinci-resolve
    proton-pass
    protonvpn-gui 
    so
	kitty
	eclipses.eclipse-platform
	jdk
  ];
}
