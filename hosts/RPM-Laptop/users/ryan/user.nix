{ config, lib, inputs, system, ... }:

{
	imports = [
		inputs.hyprland.homeManagerModules.default
		inputs.nixvim.homeManagerModules.nixvim
		./../../../../modules/user/default.nix 
		./home.nix
	];
	config = {
		modules = {
			# GUI

			# CLI
			kitty.enable = true;	
			git.enable = true;
			bash.enable = false;
			nvim.enable = true;
			zsh.enable = true;

			# SYSTEM
			packages.enable = true;
			hyprland = {
				enable = true;
				monitor = "monitor=eDP-1,1920x1080@60,0x0,1.0";
				extraConig = ./settings/hyprland.nix;
			};
		};
	};
}
