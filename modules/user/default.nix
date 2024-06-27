{ inputs, pkgs, config, ... }:

{
	imports = [
		# GUI
        ./discord
        ./qutebrowser
        ./zathura
		
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
