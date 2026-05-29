{ pkgs, ... }:

{
  programs.java = {
    enable = true;
    package = pkgs.jdk25;
  };

  home.packages = with pkgs; [
    # Dev
    nodejs
    cargo
    gcc
    # GUI
    unityhub
    evince
    readest
    nautilus
    # CLI
    zoxide
    bat
    lsd
    fzf
    ripgrep
    tree
    openvpn
    proton-vpn-cli
    nix-prefetch-git
    nix-search-cli
    # TUI
    clock-rs
    fastfetch
    btop
    pulsemixer
  ];
}
