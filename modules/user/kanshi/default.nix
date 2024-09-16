{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.kanshi;

in {
    options.modules.kanshi = { enable = mkEnableOption "kanshi"; };
    config = mkIf cfg.enable {
       services.kanshi = {
            enable = true;
            profiles = {
                undocked = {
                    outputs = [
                        {
                            criteria = "eDP-1";
                        }
                    ];
                };
                docked = {
                    outputs = [
                        {
                            criteria = "DP-1";
                        }
                    ];
                };
            };
       };
    };
}
