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

            hypridle = {
                enable = true;
                settings = {
                    general = {
                        before_sleep_cmd = "loginctl lock-session";
                        after_sleep_cmd = "hyprctl dispatch dpms on";
                        ignore_dbus_inhibit = false;
                        lock_cmd = "pidof hyprlock || hyprlock";

                    };
                    listener = [
                        {
                            timeout = 600;
                            on-timeout = "hyprlock";
                        }
                        {
                            timeout = 700;
                            on-timeout = "hyprctl dispatch dpms off";
                            on-resume = "hyprctl dispatch dpms on";
                        }
                        {
                            timeout = 12000;
                            on-timeout = "systemctl suspend";
                        }
                    ];
                };
            };
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
            # swaylock = {
            #     enable = true;
            #     settings = {
            #         color = "262626";
            #         font-size = 24;
            #         indicator-idle-visible = false;
            #         indicator-radius = 100;
            #         line-color = "ffffff";
            #         show-failed-attempts = true;
            #     };
            # };
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
    };
}
