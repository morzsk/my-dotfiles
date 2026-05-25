{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Dev
    nodejs
    cargo
    gcc
    # GUI
    evince
    readest
    nautilus
    prismlauncher
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
