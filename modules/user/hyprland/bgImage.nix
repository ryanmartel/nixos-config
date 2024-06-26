{ config }:
''
exec-once = swaybg -i ${config.bgImage}
exec = swayidle -w timeout 600 'swaylock -f -i ${config.bgImage}' timeout 601 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'
bind = $mainMod, X, exec, swaylock -i ${config.bgImage}
''
