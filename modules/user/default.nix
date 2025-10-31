{ inputs, pkgs, config, ... }:

{
	imports = [
		# GUI
        ./discord
        # ./qutebrowser
        ./zathura
        ./wofi
		
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
        ./hyprlock
        ./kanshi
	];
}
