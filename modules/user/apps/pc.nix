{ pkgs, ... }:

{
  home.packages = with pkgs; [
    prismlauncher
    # davinci-resolve
  ];
}
