{ config, pkgs, ... }:

let
    modules = ../../modules/user;
in
{
    programs.home-manager.enable = true;

    home = {
        username = "mo";
        homeDirectory = "/home/mo";

        stateVersion = "24.05";

        file = { };
        sessionVariables = { };
    };

    imports = [
        "${modules}/git.nix"
        "${modules}/bash.nix"
        "${modules}/zsh.nix"
        "${modules}/cli-utils.nix"
        "${modules}/kitty.nix"
        "${modules}/apps.nix"
        "${modules}/brave.nix"
        "${modules}/obsidian.nix"
        "${modules}/vscode.nix"
        #"${modules}/nix.nix"
        #"${modules}/python.nix"
        #"${modules}/rust.nix"
        "${modules}/hyprland.nix"
        "${modules}/gtk.nix"
        "${modules}/stylix.nix"
    ];
}
