{ config, pkgs, ... }:

let
  config = import ./config.nix;
in
{
  home.packages = with pkgs; [
    grimblast
    wl-clipboard
    wlr-randr
  ];

  wayland.windowManager.hyprland = {
    enable          = true;
    xwayland.enable = true;
    systemd.enable  = true;
    inherit (config) extraConfig;

    settings = {
      "$mod" = "SUPER";
      inherit (config) bind bindm decoration general exec-once;
    };
  };
}
