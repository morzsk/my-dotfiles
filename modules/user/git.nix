{ config, pkgs, ... }:

{
    programs.git = {
        enable = true;

        settings = {
            user.name = "mo";
            user.email = "morzsk@pm.me";

            aliases = {
                ci = "commit";
                co = "checkout";
                s = "status";
            };
        };
    };
}
