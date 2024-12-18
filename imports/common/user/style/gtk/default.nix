{ config, pkgs, ... }:

{
    gtk = {
        enable = true;

        iconTheme = {
            package = pkgs.gruvbox-plus-icons;
            name = "Gruvbox-Plus-Dark";
        };
    };
}
