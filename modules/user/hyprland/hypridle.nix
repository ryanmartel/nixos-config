{
    general = {
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        lock_cmd = "pidof hyprlock || hyprlock";

    };
    listener = [
        {
            timeout = 600;
            on-timeout = "hyprlock";
        }
        {
            timeout = 700;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
        }
        {
            timeout = 12000;
            on-timeout = "systemctl suspend";
        }
    ];

}
