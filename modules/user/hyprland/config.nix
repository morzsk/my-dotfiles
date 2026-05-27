{
	extraConfig = ''
		monitor=HDMI-A-1,1920x1080@60,0x0,1
		monitor=DP-1,1920x1080@60,-1080x0,1,transform,1

		# Window mode: $mod+W to enter, then r=resize, m=move
		bind = $mod, W, submap, window
		submap = window
		bind = , r, submap, resize
		bind = , m, submap, move
		bind = , n, submap, nudge
		bind = , f, fullscreen
		bind = , t, togglefloating
		bind = , c, centerwindow
		bind = , p, pin
		bind = , q, killactive
		bind = , g, submap, wingo
		bind = , escape, submap, reset
		submap = reset

		# Window-goto mode: move focus in direction
		submap = wingo
		bind = , h, movefocus, l
		bind = , l, movefocus, r
		bind = , k, movefocus, u
		bind = , j, movefocus, d
		bind = , escape, submap, reset
		submap = reset

		# Nudge mode (floating window pixel movement, ESC to exit)
		submap = nudge
		bind = , h, moveactive, -20 0
		bind = , l, moveactive, 20 0
		bind = , k, moveactive, 0 -20
		bind = , j, moveactive, 0 20
		bind = SHIFT, h, moveactive, -100 0
		bind = SHIFT, l, moveactive, 100 0
		bind = SHIFT, k, moveactive, 0 -100
		bind = SHIFT, j, moveactive, 0 100
		bind = , escape, submap, reset
		submap = reset

		# Resize mode (sticky: tap HJKL repeatedly, ESC to exit)
		submap = resize
		bind = , h, resizeactive, -20 0
		bind = , l, resizeactive, 20 0
		bind = , k, resizeactive, 0 -20
		bind = , j, resizeactive, 0 20
		bind = SHIFT, h, resizeactive, -100 0
		bind = SHIFT, l, resizeactive, 100 0
		bind = SHIFT, k, resizeactive, 0 -100
		bind = SHIFT, j, resizeactive, 0 100
		bind = , escape, submap, reset
		submap = reset

		# Move mode (sticky: HJKL moves window, numbers move to workspace, ESC to exit)
		submap = move
		bind = , h, movewindow, l
		bind = , l, movewindow, r
		bind = , k, movewindow, u
		bind = , j, movewindow, d
		bind = , 1, movetoworkspacesilent, 1
		bind = , 2, movetoworkspacesilent, 2
		bind = , 3, movetoworkspacesilent, 3
		bind = , 4, movetoworkspacesilent, 4
		bind = , 5, movetoworkspacesilent, 5
		bind = , 6, movetoworkspacesilent, 6
		bind = , 7, movetoworkspacesilent, 7
		bind = , 8, movetoworkspacesilent, 8
		bind = , 9, movetoworkspacesilent, 9
		bind = , 0, movetoworkspacesilent, 10
		bind = , escape, submap, reset
		submap = reset

		# Workspace mode: $mod+E to enter, numbers=switch, SHIFT+numbers=send window, H/L=cycle, ESC to exit
		bind = $mod, E, submap, workspace
		submap = workspace
		bind = SHIFT, 1, movetoworkspacesilent, 1
		bind = SHIFT, 2, movetoworkspacesilent, 2
		bind = SHIFT, 3, movetoworkspacesilent, 3
		bind = SHIFT, 4, movetoworkspacesilent, 4
		bind = SHIFT, 5, movetoworkspacesilent, 5
		bind = SHIFT, 6, movetoworkspacesilent, 6
		bind = SHIFT, 7, movetoworkspacesilent, 7
		bind = SHIFT, 8, movetoworkspacesilent, 8
		bind = SHIFT, 9, movetoworkspacesilent, 9
		bind = SHIFT, 0, movetoworkspacesilent, 10
		bind = SHIFT, h, movetoworkspacesilent, m-1
		bind = SHIFT, l, movetoworkspacesilent, m+1
		bind = , g, submap, wspgo
		bind = , escape, submap, reset
		submap = reset

		# Workspace-goto mode: cycle workspaces with h/l
		submap = wspgo
		bind = , h, workspace, m-1
		bind = , l, workspace, m+1
		bind = , 1, workspace, 1
		bind = , 2, workspace, 2
		bind = , 3, workspace, 3
		bind = , 4, workspace, 4
		bind = , 5, workspace, 5
		bind = , 6, workspace, 6
		bind = , 7, workspace, 7
		bind = , 8, workspace, 8
		bind = , 9, workspace, 9
		bind = , 0, workspace, 10
		bind = , escape, submap, reset
		submap = reset

		# Launch mode: $mod+L to enter, then q=brave w=yazi e=pulsemixer r=nvim a=obsidian s=readest
		bind = $mod, L, submap, launch
		submap = launch
		bind = , q, exec, brave
		bind = , q, submap, reset
		bind = , w, exec, kitty -e yazi
		bind = , w, submap, reset
		bind = , e, exec, kitty -e pulsemixer
		bind = , e, submap, reset
		bind = , r, exec, kitty -e nvim
		bind = , r, submap, reset
		bind = , a, exec, obsidian
		bind = , a, submap, reset
		bind = , s, exec, readest
		bind = , s, submap, reset
		bind = , escape, submap, reset
		submap = reset

		plugin {
		  hyprfocus {
		    enabled = yes
		    focus_animation = shrink
		    animate_floating = yes
		    animate_workspacechange = yes
		    shrink {
		      shrink_percentage = 0.99
		      in_bezier = 0.5 0 1 1
		      in_speed = 2
		      out_bezier = 0.5 0 1 1
		      out_speed = 2
		    }
		  }
		}
	'';

	decoration = {
	  active_opacity = 0.95;
	  inactive_opacity = 0.95;
	  blur = {
			enabled = true;
			new_optimizations = true;
			size = 16;
			passes = 4;
	  };
	};

  general = {
    border_size = 0;
  };

  bindm = [
    "$mod, mouse:272, movewindow"
  ];

	bind = [
		# General
		"$mod, return, exec, kitty"
		"$mod, R, exec, rofi -show drun"
		"$mod SHIFT, R, exec, rofi -show run"
		"$mod, Q, killactive"
		"$mod SHIFT, Q, closewindow"
		"$mod SHIFT, E, exit"

		# Screen focus
		"$mod SHIFT, F, togglefloating"
		"$mod, F, fullscreen"

		# Screencast
		"$mod, S, exec, grimblast copysave area"
		"$mod CTRL, S, exec, grimblast --cursor copysave active"
		"$mod ALT, S, exec, grimblast --cursor copysave screen"

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

		# Move to Workspaces
		"$mod ALT,  1, movetoworkspace, -1"
		"$mod ALT,  2, movetoworkspace, +1"
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

		# cycle workspaces
    "$mod, bracketleft, workspace, m-1"
    "$mod, bracketright, workspace, m+1"

		# cycle monitors
		"$mod SHIFT, bracketleft, focusmonitor, L"
		"$mod SHIFT, bracketright, focusmonitor, R"

		# Navigation
		"$mod, H, movefocus, L"
		"$mod, K, movefocus, U"
		"$mod, J, movefocus, D"

		"ALT, Tab, cyclenext"
		"ALT, Tab, bringactivetotop"
	];
}
