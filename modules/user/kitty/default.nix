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
            background = "#${config.colorScheme.colors.base00}";
            foreground = "#${config.colorScheme.colors.base05}";

            #Normal
            color0 = "#${config.colorScheme.colors.base00}";
            color1 = "#${config.colorScheme.colors.base08}";
            color2 = "#${config.colorScheme.colors.base0B}";
            color3 = "#${config.colorScheme.colors.base0A}";
            color4 = "#${config.colorScheme.colors.base0C}";
            color5 = "#${config.colorScheme.colors.base0E}";
            color6 = "#${config.colorScheme.colors.base0C}";
            color7 = "#${config.colorScheme.colors.base05}";

            # bright
            color8 = "#${config.colorScheme.colors.base03}";
            color9 = "#${config.colorScheme.colors.base09}";
            color10 = "#${config.colorScheme.colors.base01}";
            color11 = "#${config.colorScheme.colors.base02}";
            color12 = "#${config.colorScheme.colors.base04}";
            color13 = "#${config.colorScheme.colors.base06}";
            color14 = "#${config.colorScheme.colors.base0F}";
            color15 = "#${config.colorScheme.colors.base07}";

			background_opacity = "0.93";
			scrollback_lines = 5000;
			cursor-shape = "block";
		};
	};
    };
}
