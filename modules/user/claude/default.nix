{ pkgs, ... }:

{
  programs.claude-code.enable = true;

  home.packages = with pkgs; [
    claude-usage-tracker
  ];
}
