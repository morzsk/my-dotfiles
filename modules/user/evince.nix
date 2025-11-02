{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        evince
    ];

    # programs.evince = {
    #     package = pkgs.evince;
    #     enable = true;
    # };
}