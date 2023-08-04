{ config, lib, inputs, ... }:

{
	imports = [
		inputs.nixvim.homeManagerModules.nixvim
		../../../../modules/user/default.nix 
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
