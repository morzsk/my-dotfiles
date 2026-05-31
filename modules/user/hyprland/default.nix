{ pkgs, inputs, constants, ... }:

let
  decor    = import ./configs/decor.nix;
  bindings = import ./configs/bindings.nix;
  rules    = import ./configs/rules.nix;
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

  home.sessionVariables = {
    XDG_SCREENSHOTS_DIR = constants.dirs.screenshots;
  };

  wayland.windowManager.hyprland = {
    enable          = true;
    xwayland.enable = true;
    systemd.enable  = true;
    configType      = "hyprlang";
    plugins         = [ inputs.hyprfocus.packages.${pkgs.stdenv.hostPlatform.system}.hyprfocus ];
    extraConfig     = bindings.submaps + builtins.readFile ./configs/extra-config.conf;

    settings = {
      "$mod" = "SUPER";
      inherit (decor) decoration general;
      inherit (bindings) bind bindm;
      inherit (rules) "exec-once" windowrule;
    };
  };
}
