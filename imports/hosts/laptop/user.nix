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
	"${commonUser}/app/gui/eww"
	"${commonUser}/app/gui/terminal/blackbox"
	"${commonUser}/app/tui/nixvim"
	"${commonUser}/home-manager"
	"${commonUser}/style/gtk"
	"${commonUser}/style/stylix"
	"${commonUser}/wm/hyprland"
	#"${commonUser}/wm/gnome-extensions"
  ];


}

