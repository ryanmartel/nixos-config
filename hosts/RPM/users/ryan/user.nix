{ config, lib, inputs, system, ... }:

{
	imports = [
		inputs.hyprland.homeManagerModules.default
		./../../../../modules/user/default.nix 
		./home.nix
	];
	config = {
		modules = {
			# GUI
            discord.enable = true;

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
	};
}
