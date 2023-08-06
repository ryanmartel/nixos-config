{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.globalprotect;

in {
    options.modules.globalprotect = { enable = mkEnableOption "globalprotect"; };
    config = mkIf cfg.enable {
        services.globalprotect = {
            enable = true;
        };
        environment.systemPackages = [ globalprotect-openconnect ];
    };
}
