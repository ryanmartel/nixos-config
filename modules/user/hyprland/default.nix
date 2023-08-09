{ pkgs, lib, config, inputs, system, ... }:

with lib;
let cfg = config.modules.hyprland;
    bgImage = ../../../static/evening-mountains.jpg;

in {
    options.modules.hyprland = { enable = mkEnableOption "hyprland"; };
    config = mkIf cfg.enable {
        wayland.windowManager.hyprland = {
            enable = true;
            extraConfig = import ./config.nix {};
        };
        services = {
            clipman = {
                enable = true;
            };
            mako.enable = true;
            swayidle = {
                enable = true;
                timeouts = [
                    { timeout = 3; command = "${pkgs.swaylock}/bin/swaylock -f -i ${bgImage}"; }
                    { timeout = 6; command = "hyprctl dispatch dpms off"; resumeCommand = "hyprctl dispatch dpms on"; }
                ];
            };
        };
        programs = {
            waybar = {
                enable = true;
                package = inputs.hyprland.packages.${system}.waybar-hyprland;
                settings = import ./waybar.nix;
                style = import ./waybarCSS.nix;
            };
            wofi = {
                enable = true;

            };
            swaylock = {
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
    };
}
