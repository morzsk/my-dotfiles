{ pkgs, ... }:

{
  stylix = {
    enable = true;
    autoEnable = true;

    polarity = "dark";

    cursor = {
      package = pkgs.capitaine-cursors-themed;
      name = "Gruvbox";
      size = 24;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };

    base16Scheme = import ./themes/gruvbox.nix;
  };
}
