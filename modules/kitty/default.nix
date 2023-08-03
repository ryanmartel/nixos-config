{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.kitty;

in {
    options.modules.kitty = { enable = mkEnableOption "kitty"; };
    config = mkIf cfg.enable {
	programs.kitty = {
		enable = true;
#		theme = "Rosé Pine Moon";
		theme = "Tokyo Night";
		font = {
			name = "JetBrainsMono Nerd Font";
			size = 11;
		};
		settings = {
			background_opacity = "0.93";
			scrollback_lines = 5000;
			cursor-shape = "block";
		};
	};
    };
}
