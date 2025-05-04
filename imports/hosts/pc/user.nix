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
	"${commonUser}/app/gui/obs"
    "${commonUser}/app/tui/nixvim"
    "${commonUser}/home-manager"
    "${commonUser}/style/gtk"
    "${commonUser}/style/stylix"
	"${commonUser}/wm/hyprland"
	#"${commonUser}/wm/gnome-extensions"
  ];

	home.packages = with pkgs; [
    	amberol                # Amberol: A simple and elegant music player
		audacity
    	bat                    # Bat: A better `cat` command with syntax highlighting
		blender
    	bluez                  # BlueZ: Bluetooth stack for Linux
    	btop                   # Btop: Resource monitor with a beautiful UI
    	calibre                # Calibre: Ebook management software
    	dconf-editor           # Dconf Editor: Configuration editor for GNOME
		easyeffects            # Easyeffects: Limiter, compressor, convolver, equalizer and auto volume and many other plugins for PipeWire applications
		evince
    	ffmpeg                 # FFmpeg: Multimedia framework for handling audio and video
		gimp
    	glibc                  # Glibc: GNU C Library
    	grimblast              # Grimblast: Screenshot tool
    	helvum                 # Helvum: GTK-based pipewire patchbay
    	jdk                    # JDK: Java Development Kit
    	kdePackages.kdenlive   # Kdenlive: KDE's video editor
    	kitty                  # Kitty: Feature-rich terminal emulator
    	libreoffice-fresh      # LibreOffice: Office suite
    	libdbusmenu            # Libdbusmenu: Library for DBus menu
    	lsd                    # LSD: An enhanced `ls` with pretty output
    	macchina               # Macchina: System information fetcher
		mono
		#mpv
		nautilus
    	nerd-fonts.jetbrains-mono # JetBrains Mono Nerd Font
    	neofetch               # Neofetch: Display system information
		neovim-remote
   		nix-prefetch-git       # Nix Prefetch Git: Helper for fetching Git repositories
    	nix-search-cli         # Nix Search CLI: Search for Nix packages
    	obsidian               # Obsidian: Markdown-based note-taking app
		pipewire
    	prismlauncher          # Prism Launcher: Multi-platform Minecraft launcher
    	proton-pass            # Proton Pass: Password manager by Proton
    	protonvpn-gui          # ProtonVPN: GUI for ProtonVPN
    	ripgrep                # Ripgrep: A fast text search tool
    	#rofi                   # Rofi: Application launcher and window switcher
    	#seahorse               # Seahorse: GNOME keyring manager
		slurp
    	#so                     # So: Lightweight audio file player
		#steam                  # Steam: Gaming platform
		#tagger                 # Tagger: Audio file tag editor
    	thefuck                # The Fuck: Correct previous console commands
    	#timg                   # Timg: Image viewer for the terminal
    	tree                   # Tree: Display directory structure
		unityhub
		vinegar
		wine64
    	wofi                   # Wofi: GTK-based application launcher
		#xdg-desktop-portal-gtk
		#xdg-desktop-portal-wlr
    	#yazi                   # Yazi: Terminal file manager
    	youtube-music          # YouTube Music: Unofficial desktop client
		yt-dlp
	];
}
