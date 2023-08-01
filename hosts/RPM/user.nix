{ config, lib, inputs, ... }:

{
	imports = [../../modules/default.nix ];

	home = {
		username = "ryan";
		homeDirectory = "/home/ryan";
		sessionVariables = {
			EDITOR = "vim";
			BROWSER = "firefox";
			TERMINAL = "kitty";
		};
	};	
	programs.home-manager.enable = true;

	config.modules = {
		# GUI
		
		# CLI
		kitty.enable = true;	
		git.enable = true;
		bash.enable = true;

		# SYSTEM
		packages.enable = true;
	};
}
