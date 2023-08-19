{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.hyprland;

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
        };
        programs = {
            waybar = {
                enable = true;
                package = pkgs.waybar-hyprland;
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
