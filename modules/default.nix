{ inputs, pkgs, config, ... }:

{
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
