{ config, lib, inputs, system, ... }:

{
	imports = [
        inputs.hyprland.homeManagerModules.default
		inputs.nixvim.homeManagerModules.nixvim
		./../../../../modules/user/default.nix 
		./home.nix
	];
	config = {
        programs.waybar.package = inputs.hyprland.packages.${system}.waybar-hyprland;
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
        hyprland.enable = true;
	};
    };
}
