{ config, lib, inputs, ... }:

{
	imports = [../../modules/default.nix ];

	config.modules = {
		# GUI
		
		# CLI
		kitty.enable = true;	
		git.enable = true;
		bash.enable = true;

		# SYSTEM
		packages.enable = true;
	};
}
