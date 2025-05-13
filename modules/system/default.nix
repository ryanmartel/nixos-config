{ inputs, pkgs, config, ... }:

{
	imports = [
		# GUI
		./steam
		./desktopApps
		# CLI
        ./zsh
		# SYSTEM
        ./sunshine
		./packages
        ./hyprland
		./laptopcontrols
        ./postman
	];
}
