{ pkgs, inputs, ... }:

let
  decor    = import ./decor.nix;
  bindings = import ./bindings/bindings.nix;
  hyprHelp = pkgs.writeShellApplication {
    name = "hypr-help";
    runtimeInputs = with pkgs; [ jq rofi hyprland ];
    text = builtins.readFile ./scripts/hypr-help.sh;
  };
in
{
  home.packages = with pkgs; [
    grimblast
    grim
    slurp
    wl-clipboard
    wlr-randr
    hyprHelp
  ];

  wayland.windowManager.hyprland = {
    enable          = true;
    xwayland.enable = true;
    systemd.enable  = true;
    configType      = "hyprlang";
    plugins         = [ inputs.hyprfocus.packages.${pkgs.system}.hyprfocus ];
    extraConfig     = builtins.readFile ./bindings/extra-config.conf;

    settings = {
      "$mod" = "SUPER";
      inherit (decor) decoration general;
      inherit (bindings) bind bindm;
      "exec-once" = [
        "wallpaper-shuffle"
      ];
    };
  };
}
