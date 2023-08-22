{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.hyprland;

in {
    options.modules.hyprland = { 
		enable = mkEnableOption "hyprland"; 

		baseConfig = mkOption {
			type = types.lines;
			default = import ./config.nix;
			description = ''
				Configuration for hyprland.
			'';
		};

		executions = mkOption {
			type = types.lines;
			default = import ./executions.nix;
			description = ''
				Hyprland execution command config.
			'';
		};

		keybinds = mkOption {
			type = types.lines;
			default = import ./keybinds.nix;
			description = ''
				Hyprland keybind config.
			'';
		};

		extraConfig = mkOption {
			type = types.lines;
			default = "";
			description = ''
				Extra configuration lines to append to config.nix
			'';
		};

		waybarConfig = mkOption {
			type = types.attrs;
			default = import ./waybar.nix;
			description = ''
				Configuration for waybar.
			'';
		};

		waybarCSS = mkOption {
			type = types.lines;
			default = import ./waybarCSS.nix;
			description = ''
				StyleSheet for waybar configuration.
			'';
		};

	};
    config = mkIf cfg.enable {
        wayland.windowManager.hyprland = {
            enable = true;
            extraConfig = cfg.baseConfig + cfg.executions + cfg.keybinds + cfg.extraConfig;
        };
        services = {
            clipman = {
                enable = true;
            };
            mako.enable = true;
        };
        programs = {
            waybar = {
                enable = true;
                package = pkgs.waybar-hyprland;
                settings = cfg.waybarConfig;
                style = cfg.waybarCSS;
            };
            wofi = {
                enable = true;

            };
            swaylock = {
                enable = true;
                settings = {
                    color = "262626";
                    font-size = 24;
                    indicator-idle-visible = false;
                    indicator-radius = 100;
                    line-color = "ffffff";
                    show-failed-attempts = true;
                };
            };
        };
    };
}
