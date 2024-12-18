{config, pkgs, ... }:

{
	wayland.windowManager.hyprland = {
		enable = true;
		package = pkgs.hyprland;
		xwayland.enable = true;
		systemd.enable = true;
		
		settings = {
			#input = {
			#	kb_layout = "uk";
			#};

			decoration = {
				active_opacity = 0.85;
				inactive_opacity = 0.85;
				blur = {
					enabled = true;
					new_optimizations = true;
					size = 14;
					passes = 4;
				};
			};
	
			"$mod" = "SUPER";

			bind = [
				# General
				"$mod, return, exec, kitty"
				"$mod, R, exec, rofi -show drun"
				"$mod, Q, killactive"
				"$mod SHIFT, Q, closewindow"
				"$mod, E, exit"

				# Screen focus
				"$mod SHIFT, F, togglefloating"
				"$mod, F, fullscreen"

				# Screen resize
				"$mod CTRL, H, resizeactive, -10 0"
				"$mod CTRL, L, resizeactive, 10 0"
				"$mod CTRL, K, resizeactive, 0 -10"
				"$mod CTRL, J, resizeactive, 0 10"
				
				# Screencast
				"$mod, S, exec, grimblast --cursor copysave area"
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
				"$mod, 1, movetoworkspace, 1"
				"$mod, 2, movetoworkspace, 2"
				"$mod, 3, movetoworkspace, 3"
				"$mod, 4, movetoworkspace, 4"
				"$mod, 5, movetoworkspace, 5"
				"$mod, 6, movetoworkspace, 6"
				"$mod, 7, movetoworkspace, 7"
				"$mod, 8, movetoworkspace, 8"
				"$mod, 9, movetoworkspace, 9"
				"$mod, 0, movetoworkspace, 10"
				
				# Navigation
				"$mod, H, movefocus, L"
				"$mod, L, movefocus, R"
				"$mod, K, movefocus, U"
				"$mod, J, movefocus, D"

				"ALT, Tab, cyclenext"
				"ALT, Tab, bringactivetotop"
			];
		};
	};
}
