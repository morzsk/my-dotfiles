{ pkgs, ... }:

let
  config = import ./config.nix;
in
{
  home.packages = with pkgs; [
    grimblast
    grim
    slurp
    wl-clipboard
    wlr-randr
  ];

  wayland.windowManager.hyprland = {
    enable          = true;
    xwayland.enable = true;
    systemd.enable  = true;
    configType      = "hyprlang";
    inherit (config) extraConfig;

    settings = {
      "$mod" = "SUPER";
      inherit (config) bind bindm decoration general;
      "exec-once" = config."exec-once";
    };
  };
}
