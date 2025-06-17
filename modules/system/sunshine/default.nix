{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.sunshine;

in {
    options.modules.sunshine = { enable = mkEnableOption "sunshine"; };
    config = mkIf cfg.enable {
        services.sunshine = {
            enable = true;
            autoStart = true;
            capSysAdmin = true;
            openFirewall = true;

        }; 
    };
}
