{ inputs, pkgs, config, ... }:

{
	imports = [
		# GUI
		
		# CLI
		./alacritty
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
