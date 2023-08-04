{ inputs, pkgs, config, ... }:

{
	imports = [
		# GUI
		
		# CLI
		./kitty
		./git
		./bash
		./nvim
		# SYSTEM
		./packages
	];
}
