{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.gimp;

in {
    options.modules.gimp = { enable = mkEnableOption "gimp"; };
    config = mkIf cfg.enable {
		environment.systemPackages = [
			pkgs.gimp
		];
    };
}
