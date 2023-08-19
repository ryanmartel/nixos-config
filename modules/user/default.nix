{ inputs, pkgs, config, ... }:

{
	imports = [
		# GUI
		
		# CLI
		./kitty
		./git
		./bash
		./nvim
        ./zsh
		# SYSTEM
		./packages
        ./hyprland
	];
}
