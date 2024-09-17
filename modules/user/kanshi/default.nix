{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.kanshi;

in {
    options.modules.kanshi = { enable = mkEnableOption "kanshi"; };
    config = mkIf cfg.enable {
       services.kanshi = {
            enable = true;
            settings = [
            { profile.name = "undocked";
                profile.outputs = [
                {
                    criteria = "eDP-1";
                }

                ];
            }
            { profile.name = "docked";
                profile.outputs = [
                {
                    criteria = "DP-1";
                    status = "enable";
                }
                {
                    criteria = "eDP-1";
                    status = "disable";
                }
                ];
            }
            ];
       };
    };
}
