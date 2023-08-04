{ inputs, pkgs, config, ... }:

{
	imports = [
		# GUI
		./steam
		# CLI

		# SYSTEM
		./packages
	];
}
