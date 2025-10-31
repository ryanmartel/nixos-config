{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.kitty;

in {
    options.modules.kitty = { enable = mkEnableOption "kitty"; };
    config = mkIf cfg.enable {
	programs.kitty = {
        shellIntegration = {
            enableZshIntegration = true;
        };
		enable = true;
#		theme = "Rosé Pine Moon";
		# theme = "Tokyo Night";
		font = {
			name = "JetBrainsMono";
			size = 11;
		};
		settings = {
            background = "#${config.colorScheme.palette.base00}";
            foreground = "#${config.colorScheme.palette.base05}";

            #Normal
            color0 = "#${config.colorScheme.palette.base00}";
            color1 = "#${config.colorScheme.palette.base08}";
            color2 = "#${config.colorScheme.palette.base0B}";
            color3 = "#${config.colorScheme.palette.base0A}";
            color4 = "#${config.colorScheme.palette.base0C}";
            color5 = "#${config.colorScheme.palette.base0E}";
            color6 = "#${config.colorScheme.palette.base0C}";
            color7 = "#${config.colorScheme.palette.base05}";

            # bright
            color8 = "#${config.colorScheme.palette.base03}";
            color9 = "#${config.colorScheme.palette.base09}";
            color10 = "#${config.colorScheme.palette.base01}";
            color11 = "#${config.colorScheme.palette.base02}";
            color12 = "#${config.colorScheme.palette.base04}";
            color13 = "#${config.colorScheme.palette.base06}";
            color14 = "#${config.colorScheme.palette.base0F}";
            color15 = "#${config.colorScheme.palette.base07}";

			background_opacity = "0.93";
			scrollback_lines = 5000;
			cursor-shape = "block";
		};
        keybindings = {
            "ctrl+shift+t" = "launch --cwd=current --type=tab";
        };
	};
    };
}
