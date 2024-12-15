{ inputs, pkgs, config, ... }:

{
	imports = [
		# GUI
		./steam
		./desktopApps
		# CLI
        ./zsh
		# SYSTEM
		./packages
        ./hyprland
		./laptopcontrols
        ./postman
	];
}
