{ config, lib, inputs, system, ... }:

{
	imports = [
		inputs.hyprland.homeManagerModules.default
        inputs.nix-colors.homeManagerModules.default
		./../../../../modules/user/default.nix 
		./home.nix
	];
	config = {
        colorScheme = inputs.nix-colors.colorSchemes.seti;

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
