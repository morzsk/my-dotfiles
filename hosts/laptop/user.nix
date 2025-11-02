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

    # xdg = {
    #     mimeApps = { # TODO: Fix
    #         defaultApplications = {
    #             "application/pdf" = [ "evince" ];
    #         };
    #     };
    # };

    imports = [
        "${modules}/git.nix"
        "${modules}/bash.nix"
        "${modules}/zsh.nix"
        "${modules}/python.nix"
        "${modules}/java.nix"
        "${modules}/cli-utils.nix"
        "${modules}/cli-utils.nix"
        "${modules}/yazi.nix"
        "${modules}/evince.nix"
        "${modules}/kitty.nix"
        "${modules}/apps.nix"
        "${modules}/brave.nix"
        "${modules}/obsidian.nix"
        "${modules}/vscode.nix"
        "${modules}/rofi.nix"
        "${modules}/hyprland.nix"
        "${modules}/gtk.nix"
        "${modules}/stylix.nix"
    ];
    
    home.packages = with pkgs; [
        readest
    ];
}
