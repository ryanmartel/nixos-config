let 
bgImage = ../../../static/magical-valley.jpg;
in
''
# Execute your favorite apps at launch
# exec-once = waybar & hyprpaper & firefox
exec-once = dbus-update-activation-environment --systemd DISPLAY WALAND_DISPLAY
exec-once = waybar
exec-once = swaybg -i ${bgImage}
exec-once = wl-paste -p -t text --watch clipman store -P --histpath="~/.local/share/clipman-primary.json"
exec = swayidle -w timeout 600 'swaylock -f -i ${bgImage}' timeout 601 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'
''
