{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.hyprlock;

in {
	options.modules.hyprlock = { enable = mkEnableOption "hyprlock"; };
	config = mkIf cfg.enable {
		programs.hyprlock = {
            hyprlock = {
                enable = true;
                settings = {
                    general = {
                        hide-cursor = true;
                        grace = 10;
                    };

                    background = [
                        {
                            path = "${config.background.bgImage}";
                            blur_passes = 3;
                            blur_size = 8;
                        }
                    ];

                    input-field = [
                        {
                            size = "200, 50";
                            position = "0, 0";
                            monitor = "";
                            dots_center = true;
                            fade_on_empty = false;
                            font_color = "rgb(202, 211, 245)";
                            inner_color = "rgb(91, 96, 120)";
                            outer_color = "rgb(24, 25, 38)";
                            outline_thickness = 5;
                            placeholder_text = ''<span foreground="##cad3f5">Password...</span>'';
                            shadow_passes = 2;
                        }
                    ];
                };
		};
	};
}
