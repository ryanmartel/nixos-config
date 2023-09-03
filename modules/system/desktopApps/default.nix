{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.desktopApps;

in {
    options.modules.desktopApps = { enable = mkEnableOption "desktopApps"; };
    config = mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
            libsForQt5.konsole
			google-chrome
			gimp
			obs-studio
			spotify
			slack
			teams
		];	
    };
}
