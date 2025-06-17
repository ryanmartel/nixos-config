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
                profile.exec = [
                    ''hyprctl keyword monitor eDP-1,1920x1200,0x0,1''
                    ''hyprctl keyword unbind SUPER, P''
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
                profile.exec = [
                    ''hyprctl keyword monitor DP-1,3440x1440,0x0,1''
                    ''hyprctl keyword unbind SUPER, P''
                    ''hyprctl keyword bind SUPER, P, exec, kanshictl switch both''
                ];
            }
            { profile.name = "both";
                profile.outputs = [
                {
                    criteria = "DP-1";
                    status = "enable";
                }
                {
                    criteria = "eDP-1";
                    status = "enable";
                }
                ];
                profile.exec = [
                    ''hyprctl keyword monitor DP-1,3440x1440,0x0,1''
                    ''hyprctl keyword monitor eDP-1,1920x1200,3440x0,1''
                    ''hyprctl keyword unbind SUPER, P''
                    ''hyprctl keyword bind SUPER, P, exec, kanshictl switch docked''
                ];
            }
            ];
       };
    };
}
