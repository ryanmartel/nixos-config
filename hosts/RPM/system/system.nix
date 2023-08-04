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
	#CLI

	#SYSTEM
	packages.enable = true;
    };
}
