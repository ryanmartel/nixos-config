{ config, lib, inputs, ... }:

{
	imports = [
		inputs.nixneovim.nixosModules.default
		inputs.nixvim.homeManagerModules.nixvim
		../../modules/default.nix 
		./home.nix
	];
	config.modules = {
		# GUI
		
		# CLI
		kitty.enable = true;	
		git.enable = true;
		bash.enable = true;
		nvim.enable = false;
		neonix.enable = true;

		# SYSTEM
		packages.enable = true;
	};
}
