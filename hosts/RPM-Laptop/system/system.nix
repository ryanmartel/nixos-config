{config, lib, inputs, ... }:

{
    imports = [
	./configuration.nix
	./hardware-configuration.nix
	./../../../modules/system/default.nix
    ];
    config.modules = {
	# GUI
	steam.enable = true;
	chrome.enable = true;
	spotify.enable = true;
	gimp.enable = true;
	obs.enable = true;
	#CLI
	zsh.enable = true;
	#SYSTEM
	hyprland.enable = true;
	packages.enable = true;
	globalprotect.enable = true;
    };
}