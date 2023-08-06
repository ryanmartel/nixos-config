{ inputs, pkgs, config, ... }:

{
	imports = [
		# GUI
		./steam
        ./chrome
		# CLI
        ./zsh
		# SYSTEM
		./packages
        ./globalprotect
	];
}
