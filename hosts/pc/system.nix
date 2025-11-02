{ config, pkgs, ... }:

let
    modules = ../../modules/system;
in
{
    networking.hostName = "pc";

    users.users.mo = {
        isNormalUser = true;
        description = "mo r";
        home = "/home/mo";
        extraGroups = [ "networkmanager" "wheel" ];
    };

    imports = [
        "${modules}/bootloader.nix"
        "${modules}/locale.nix"
        "${modules}/ly.nix"
        "${modules}/networking.nix"
        "${modules}/nix.nix"
        "${modules}/pipewire.nix"
        "${modules}/printing.nix"
        "${modules}/stylix"
    ];
}