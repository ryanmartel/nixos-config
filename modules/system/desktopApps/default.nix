{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.desktopApps;
in {
    options.modules.desktopApps = { enable = mkEnableOption "desktopApps"; };
    config = mkIf cfg.enable {
		environment.systemPackages = with pkgs; [
            libsForQt5.konsole
            libsForQt5.okular
			google-chrome
			gimp
			obs-studio
            qutebrowser
			spotify
            mdbook
            calibre
            cheese
            vscode
            teams-for-linux
            discord-screenaudio
            pavucontrol
            moonlight-qt
		];	
    };
}
