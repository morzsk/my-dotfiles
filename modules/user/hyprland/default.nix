{ config, pkgs, ... }:

let
  config = import ./config.nix;
in
{
  home.packages = with pkgs; [
    grimblast
    wl-clipboard
    wlr-randr
    hyprland 
    #inputs.swww.packages.${pkgs.system}.swww
    # inputs.hyprfocus.packages.${pkgs.system}.hyprfocus
  ];

  wayland.windowManager.hyprland = {
    enable          = true;
    xwayland.enable = true;
    systemd.enable  = true;

    # package = inputs.hyprland.packages.${pkgs.system}.default;
    # plugins = with inputs.hyprland-plugins.packages.${pkgs.system}; [];

    inherit (config) extraConfig;

    settings = {
      "$mod" = "SUPER";
      
      inherit (config) bind bindm decoration;

      exec-once = [
        "swww-daemon"
      ];

      general = {
        border_size = 0;
      };
    };
  };
}
