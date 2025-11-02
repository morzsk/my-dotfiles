{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        python313
    ] ++ (with pkgs.python313Packages; [
        numpy
        pandas
    ]);
}