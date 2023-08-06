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
	#CLI
    zsh.enable = true;
	#SYSTEM
	packages.enable = true;
    };
}
