{ inputs, pkgs, config, ... }:

{
	imports = [
		# GUI
		./steam
		# CLI
        ./zsh
		# SYSTEM
		./packages
	];
}
