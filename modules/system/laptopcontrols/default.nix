{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.laptopcontrols;

in {
    options.modules.laptopcontrols = { enable = mkEnableOption "laptopcontrols"; };
    config = mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			brightnessctl
		];
    };
}
