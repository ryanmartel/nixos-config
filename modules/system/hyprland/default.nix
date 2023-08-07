{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.hyprland;

in {
    options.modules.hyprland = { enable = mkEnableOption "hyprland"; };
    config = mkIf cfg.enable {
        services = {
            xserver = {
                enable = true;

                desktopManager = {
                    xterm.enable = false;
                };

                displayManager = {
                    lightdm.enable = false;
                    gdm = {
                        enable = true;
                        wayland = true;
                    };
                };
            };
        };
#        programs = {
 #           hyprland = {
  #              enable = true;
   #             xwayland = {
    #                enable = true;
     #           };
      #      };
       # };
        environment.systemPackages = with pkgs; [
            waybar # status bar
            swaybg # wallpaper
            swayidle # idle timeout
            swaylock # lock screen
            wlogout # logout menu
            wl-clipboard # copy and pasting
            wf-recorder # screen capture
            grim # screenshots
            slurp # select region to screenshot
            mako # notifications
            libsForQt5.dolphin # file explorer
        ];
    };
}
