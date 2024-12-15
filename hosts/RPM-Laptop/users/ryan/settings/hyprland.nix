''
bind=,XF86MonBrightnessUp, exec, brightnessctl set 10%+
bind=,XF86MonBrightnessDown, exec, brightnessctl set 10%-
bind=,XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle
bind=,XF86AudioLowerVolume, exec, wpctl set-volume -l 1.0 @DEFAULT_SINK@ 5%-
bind=,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.0 @DEFAULT_SINK@ 5%+
bind = $mainMod, X, exec, hyprlock
exec-once = kanshi
exec-once = kanshictl reload
''
