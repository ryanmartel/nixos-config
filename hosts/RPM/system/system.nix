{config, lib, inputs, ... }:

{
    imports = [
	./configuration.nix
	./hardware-configuration.nix
	./../../../modules/system/default.nix
    ];
    config.modules = {
		steam.enable = true;
		desktopApps.enable = true;
		zsh.enable = true;
		hyprland.enable = true;
		packages.enable = true;
		globalprotect.enable = true;
        stable.enable = false;
    };
}
