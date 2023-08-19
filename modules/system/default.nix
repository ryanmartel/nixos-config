{ inputs, pkgs, config, ... }:

{
	imports = [
		# GUI
		./gimp
		./steam
        ./chrome
        ./spotify
		./obs
		# CLI
        ./zsh
		# SYSTEM
		./packages
        ./hyprland
        ./globalprotect
	];
}
