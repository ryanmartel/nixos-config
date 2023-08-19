{ inputs, pkgs, config, ... }:

{
	imports = [
		# GUI
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
