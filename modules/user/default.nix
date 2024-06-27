{ inputs, pkgs, config, ... }:

{
	imports = [
		# GUI
        ./discord
        ./qutebrowser
		
		# CLI
		./kitty
		./git
		./bash
		./nvim
        ./zsh
        ./direnv
        ./ranger
		# SYSTEM
		./packages
        ./hyprland
	];
}
