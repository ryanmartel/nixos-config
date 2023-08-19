{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.obs;

in {
    options.modules.obs = { enable = mkEnableOption "obs"; };
    config = mkIf cfg.enable {
		environment.systemPackages = [
			pkgs.obs-studio
		];
    };
}
