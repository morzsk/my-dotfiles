{ config, pkgs, ... }:

let
    modules = ../../modules/system;
in
{
    networking.hostName = "laptop";
    programs.zsh.enable = true;

    users.users.mo = {
        isNormalUser = true;
        description = "mo raza";
        home = "/home/mo";
        extraGroups = [ "networkmanager" "wheel" ];
        shell = pkgs.zsh;
    };

    imports = [
        "${modules}/bootloader.nix"
        "${modules}/locale.nix"
        "${modules}/ly.nix"
        "${modules}/networking.nix"
        "${modules}/tailscale.nix"
        "${modules}/nix.nix"
        "${modules}/pipewire.nix"
        "${modules}/printing.nix"
        "${modules}/stylix.nix"
        "${modules}/seahorse.nix"
    ];
}
