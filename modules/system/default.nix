{ inputs, pkgs, config, ... }:

{
	imports = [
		# GUI
		./gimp
		./steam
        ./chrome
        ./spotify
		# CLI
        ./zsh
		# SYSTEM
		./packages
        ./hyprland
        ./globalprotect
	];
}
