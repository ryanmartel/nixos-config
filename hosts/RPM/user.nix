{ config, lib, inputs, ... }:

{
	imports = [
		inputs.nixneovim.nixosModules.default
		../../modules/default.nix 
		./home.nix
	];
	config.modules = {
		# GUI
		
		# CLI
		kitty.enable = true;	
		git.enable = true;
		bash.enable = true;
		nvim.enable = true;

		# SYSTEM
		packages.enable = true;
	};
}
