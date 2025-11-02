{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        # screenshot
        grimblast
        # utils
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

        extraConfig = ''
        monitor = HDMI-A-1, 1920x1080@60, auto, 1
        monitor = DP-1, 1920x1080@60, auto-left, 1, transform, 1
        '';

        settings = {
        "$mod" = "SUPER";
        
        bind = [
            # ── General ───────────────────────────────────────────────
            "$mod, return, exec, kitty"
            "$mod, R, exec, rofi -show drun"
            "$mod SHIFT, R, exec, rofi -show run"
            "$mod, Q, killactive"
            "$mod SHIFT, Q, closewindow"
            "$mod, E, exit"
            "$mod, W, exec, woomer"

            # ── Window state ──────────────────────────────────────────
            "$mod SHIFT, F, togglefloating"
            "$mod, F, fullscreen"

            # ── Resize ────────────────────────────────────────────────
            "$mod CTRL, H, resizeactive, -10 0"
            "$mod CTRL, L, resizeactive, 10 0"
            "$mod CTRL, K, resizeactive, 0 -10"
            "$mod CTRL, J, resizeactive, 0 10"

            # ── Screenshots / screencast ──────────────────────────────
            "$mod, S, exec, grimblast copysave area"
            "$mod CTRL, S, exec, grimblast copysave active"
            "$mod ALT, S, exec, grimblast copysave screen"

            # ── Workspaces ────────────────────────────────────────────
            "$mod, 1, workspace, 1"
            "$mod, 2, workspace, 2"
            "$mod, 3, workspace, 3"
            "$mod, 4, workspace, 4"
            "$mod, 5, workspace, 5"
            "$mod, 6, workspace, 6"
            "$mod, 7, workspace, 7"
            "$mod, 8, workspace, 8"
            "$mod, 9, workspace, 9"
            "$mod, 0, workspace, 10"

            # Move focused window to Ws ±1, or silently to an absolute Ws
            "$mod ALT, 1, movetoworkspace, -1"
            "$mod ALT, 2, movetoworkspace, +1"
            "$mod CTRL, 1, movetoworkspacesilent, 1"
            "$mod CTRL, 2, movetoworkspacesilent, 2"
            "$mod CTRL, 3, movetoworkspacesilent, 3"
            "$mod CTRL, 4, movetoworkspacesilent, 4"
            "$mod CTRL, 5, movetoworkspacesilent, 5"
            "$mod CTRL, 6, movetoworkspacesilent, 6"
            "$mod CTRL, 7, movetoworkspacesilent, 7"
            "$mod CTRL, 8, movetoworkspacesilent, 8"
            "$mod CTRL, 9, movetoworkspacesilent, 9"
            "$mod CTRL, 0, movetoworkspacesilent, 10"

            # ── Focus/navigation ──────────────────────────────────────
            "$mod, H, movefocus, L"
            "$mod, L, movefocus, R"
            "$mod, K, movefocus, U"
            "$mod, J, movefocus, D"

            "ALT, Tab, cyclenext"
            "ALT, Tab, bringactivetotop"
        ];

        exec-once = [
            "swww-daemon"
        ];

        general = {
            border_size = 0;
        };

        decoration = {
            active_opacity   = 0.65;
            inactive_opacity = 0.65;
            blur = {
            enabled           = true;
            new_optimizations = true;
            size              = 14;
            passes            = 4;
            };
        };
        };
    };
}
