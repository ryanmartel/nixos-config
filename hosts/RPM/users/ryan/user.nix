{ config, lib, inputs, ... }:

{
	imports = [
		inputs.nixvim.homeManagerModules.nixvim
        inputs.hyprland.homeManagerModules.default
		./../../../../modules/user/default.nix 
		./home.nix
	];
	config.modules = {
		# GUI
		
		# CLI
		kitty.enable = true;	
		git.enable = true;
		bash.enable = false;
		nvim.enable = true;
        zsh.enable = true;

		# SYSTEM
		packages.enable = true;
        hyprland.enable = true;
	};
}
