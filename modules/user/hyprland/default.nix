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
			default = import ./executions.nix{ inherit config; };
			description = ''
				Hyprland execution command config.
			'';
		};

        windowRules = mkOption {
            type = types.lines;
            default = import ./windowRules.nix;
            description = ''
                Window Rules for hyprland config.
            '';
        };

		keybinds = mkOption {
			type = types.lines;
			default = import ./keybinds.nix{ inherit config; };
			description = ''
				Hyprland keybind config.
			'';
		};

		monitor = mkOption {
			type = types.lines;
			default = import ./monitor.nix;
			description = ''
				Hyprland monitor setting config.
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
			default = import ./waybarCSS.nix{ inherit config; };
			description = ''
				StyleSheet for waybar configuration.
			'';
		};

        hypridle = mkOption {
            type = types.attrs;
            default = import ./hypridle.nix;
            description = ''
                Configuration for hypridle. uses hyprlock by default
            '';
        };

	};
    config = mkIf cfg.enable {
        wayland.windowManager.hyprland = {
            enable = true;
            extraConfig = cfg.baseConfig + cfg.executions + cfg.keybinds + cfg.extraConfig + cfg.monitor + cfg.windowRules;
        };
        services = {
            clipman = {
                enable = true;
            };

            mako.enable = true;

            # hypridle = {
            #     enable = true;
            #     # settings = cfg.hypridle;
            # };
        };
        programs = {
            waybar = {
                enable = true;
                package = pkgs.waybar;
                settings = cfg.waybarConfig;
                style = cfg.waybarCSS;
            };
            # wofi = {
            #     enable = true;
            #
            # };
        };
    };
}
