{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.desktopApps;
postman = pkgs.postman.overrideAttrs (final: prev: {
        version = "10.18.0";
        });

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
#			teams
            calibre
            gnome.cheese
            # postman
		];	
    };
}
