{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.neonix;

in {
    options.modules.neonix = { enable = mkEnableOption "neonix"; };
    config = mkIf cfg.enable {
	programs.nixvim = {
	    enable = true;
	};
    };
}
