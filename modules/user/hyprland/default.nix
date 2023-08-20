{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.hyprland;

in {
    options.modules.hyprland = { 
		enable = mkEnableOption "hyprland"; 

		extraConfig = mkOption {
			type = types.lines;
			default = import ./config.nix {};
			description = ''
				Extra configuration lines to add to `~/.config/hypr/hyprland.conf`.
			'';
		};
	};
    config = mkIf cfg.enable {
        wayland.windowManager.hyprland = {
            enable = true;
            extraConfig = cfg.extraConfig;
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
                settings = import ./waybar.nix;
                style = import ./waybarCSS.nix;
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
