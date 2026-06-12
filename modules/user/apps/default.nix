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
    qemu
    gcc-arm-embedded
    # GUI
    # unityhub
    evince
    readest
    nautilus
    pear-desktop
    # CLI
    gnome-epub-thumbnailer
    tree
    openvpn
    proton-vpn-cli
    nix-prefetch-git
    nix-search-cli
    # TUI
    clock-rs
    pulsemixer
    serie
  ];
}
