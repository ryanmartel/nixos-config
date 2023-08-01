{ inputs, pkgs, config, ... }:

{
	home.stateVersion = "23.05";
	
	imports = [
		# GUI
		
		# CLI
		./kitty
		./git
		./bash
		# SYSTEM
		./packages
	];
#	home = {
#		username = "ryan";
#		homeDirectory = "/home/ryan";
#		sessionVariables = {
#			EDITOR = "vim";
#			BROWSER = "firefox";
#			TERMINAL = "kitty";
#		};
#	};	
#	programs.home-manager.enable = true;
}
