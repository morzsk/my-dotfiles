{ pkgs, ... }:

{
  programs.java = {
    enable = true;
    package = pkgs.jdk25;
  };

  home.packages = with pkgs; [
    # Dev
    nodejs
    rustc
    cargo
    clippy
    rustfmt
    gcc
    # GUI
    unityhub
    evince
    readest
    nautilus
    # CLI
    ripgrep
    tree
    openvpn
    proton-vpn-cli
    nix-prefetch-git
    nix-search-cli
    # TUI
    clock-rs
    pulsemixer
  ];
}
