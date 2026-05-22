{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Dev
    nodejs
    cargo
    gcc
    # CLI
    bat
    lsd
    ripgrep
    tree
    openvpn
    nix-prefetch-git
    nix-search-cli
    proton-vpn-cli
    # TUI
    pulsemixer
    btop
    claude-code
    opencode
    # GUI
    evince
    readest
    nautilus
  ];
}
