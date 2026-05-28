{
  bind = [
    # General
    "$mod, return, exec, kitty"
    "$mod, R, exec, rofi -show drun"
    "$mod SHIFT, R, exec, rofi -show run"
    "$mod, slash, exec, hypr-help"
    "$mod, Q, killactive"
    "$mod SHIFT, E, exit"

    # Workspaces
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

    # Cycle workspaces
    "$mod, bracketleft, workspace, m-1"
    "$mod, bracketright, workspace, m+1"

    # Move window to adjacent workspace and follow (creates if needed)
    "$mod ALT, bracketleft, movetoworkspace, r-1"
    "$mod ALT, bracketright, movetoworkspace, r+1"

    # Cycle monitors
    "$mod SHIFT, bracketleft, focusmonitor, L"
    "$mod SHIFT, bracketright, focusmonitor, R"

    # Navigation
    "$mod, H, movefocus, L"
    "$mod, J, movefocus, D"
    "$mod, K, movefocus, U"

    "ALT, Tab, cyclenext"
    "ALT, Tab, bringactivetotop"
  ];

  bindm = [
    "$mod, mouse:272, movewindow"
  ];
}
