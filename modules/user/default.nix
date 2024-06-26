{ inputs, pkgs, config, ... }:

{
	imports = [
		# GUI
        ./discord
		
		# CLI
		./kitty
		./git
		./bash
		./nvim
        ./zsh
        ./direnv
		# SYSTEM
		./packages
        ./hyprland
        ./background
	];
}
