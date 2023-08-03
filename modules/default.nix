{ inputs, pkgs, config, ... }:

{
	imports = [
		# GUI
		
		./steam
		# CLI
		./kitty
		./git
		./bash
		./nvim
		./neonix
		# SYSTEM
		./packages
	];
}
