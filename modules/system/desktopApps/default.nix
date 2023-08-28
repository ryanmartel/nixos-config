{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.desktopApps;

in {
    options.modules.desktopApps = { enable = mkEnableOption "desktopApps"; };
    config = mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
			google-chrome
			gimp
			obs-studio
			spotify
			teams
		];	
    };
}
