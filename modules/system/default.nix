{ inputs, pkgs, config, ... }:

{
	imports = [
		# GUI
		./steam
		./desktopApps
        ./minecraft-client
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
