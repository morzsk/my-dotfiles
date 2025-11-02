{ config, pkgs, ... }:

{
    stylix = {
        enable = true;
        autoEnable = true;

        polarity = "dark";

        image = ./my-cool-wallpaper.png;
	
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

        #Kitty
		# base16Scheme = {
            # base00 = "1E1E2E";
            # base01 = "1A1826";
            # base02 = "302D41";
            # base03 = "575268";
            # base04 = "6E6C7E";
            # base05 = "D7DAE0";
            # base06 = "F5E0DC";
            # base07 = "C9CBFF";
            # base08 = "F28FAD";
            # base09 = "F8BD96";
            # base0A = "FAE3B0";
            # base0B = "ABE9B3";
            # base0C = "B5E8E0";
            # base0D = "96CDFB";
            # base0E = "DDB6F2";
            # base0F = "F2CDCD";
		# };

        # Gruvbox AMOLED
        base16Scheme = {
            base00 = "000000"; # Pure black background
            base01 = "000000"; # Darker gray
            base02 = "282828"; # Dark gray
            base03 = "3c3836"; # Medium gray
            base04 = "504945"; # Light gray
            base05 = "ebdbb2"; # Light text color
            base06 = "fbf1c7"; # Lighter text color
            base07 = "f9f5d7"; # Near-white
            base08 = "fb4934"; # Red
            base09 = "fe8019"; # Orange
            base0A = "fabd2f"; # Yellow
            base0B = "b8bb26"; # Green
            base0C = "8ec07c"; # Aqua/Cyan
            base0D = "83a598"; # Blue
            base0E = "d3869b"; # Purple
            base0F = "d65d0e"; # Brown
        };
    };
}
