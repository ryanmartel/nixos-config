{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.swaylock;

in {
	options.modules.swaylock = { enable = mkEnableOption "swaylock"; };
	config = mkIf cfg.enable {
		programs.swaylock = {
                enable = true;
                settings = {
                    color = "262626";
                    font-size = 24;
                    indicator-idle-visible = false;
                    indicator-radius = 100;
                    line-color = "ffffff";
                    show-failed-attempts = true;
                };
		};
	};
}
