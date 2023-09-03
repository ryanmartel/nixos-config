{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.packages;

in {
    options.modules.packages = { enable = mkEnableOption "packages"; };
    config = mkIf cfg.enable {
	environment.systemPackages = with pkgs; [
	    vim
	    wget
	    git
	    curl
        sshfs
	];
    };
}
