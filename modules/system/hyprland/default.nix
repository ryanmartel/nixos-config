{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.hyprland;

in {
    options.modules.hyprland = { enable = mkEnableOption "hyprland"; };
    config = mkIf cfg.enable {
        security.pam.services.swaylock = {};
        services = {
            xserver = {
                enable = true;
                videoDrivers = ["amdgpu"];
                displayManager = {
                    gdm = {
                        enable = true;
                        wayland = true;
                    };
                };
            };

        };
        programs.hyprland = {
            enable = true;
            xwayland.enable = true;
        };
        environment.systemPackages = with pkgs; [
            xdg-desktop-portal-hyprland # Desktop Portal
        #    waybar # status bar
            swaybg # wallpaper
          #  swayidle # idle timeout
           # swaylock # lock screen
          #  wlogout # logout menu
           # wl-clipboard # copy and pasting
            #wf-recorder # screen capture
            #grim # screenshots
            #slurp # select region to screenshot
            #mako # notifications
            libsForQt5.dolphin # file explorer
        ];
    };
}
