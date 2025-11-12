{ config, pkgs, ... }:

{
    programs.java.enable = true;
    programs.java.package = pkgs.openjdk11;
    programs.gradle.enable = true;
}