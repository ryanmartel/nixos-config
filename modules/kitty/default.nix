{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.PROGRAM;

in {
    options.modules.PROGRAM = { enable = mkEnableOption "PROGRAM"; };
    config = mkIf cfg.enable {
	programs.kitty = {
		enable = true;
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
