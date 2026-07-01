{ pkgs, inputs, ... }:

{
  programs.java = {
    enable = true;
    package = pkgs.jdk25;
  };

  home.packages = with pkgs; [
    # Roblox
    inputs.rokit.packages.${pkgs.system}.default
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
    signal-desktop
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
