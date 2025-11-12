{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
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
    ];
}
