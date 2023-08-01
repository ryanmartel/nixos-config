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
}
