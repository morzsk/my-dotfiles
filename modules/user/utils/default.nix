{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        (lib.lowPrio gdb)
        qemu
        gcc-arm-embedded
        pulsemixer
        btop
        bat
        lsd
        tree
        ripgrep
        nix-prefetch-git
        nix-search-cli 
        nautilus
        proton-vpn-cli
        openvpn
        nodejs
        claude-code
        opencode
    ];
}
