let 
	bgImage = ../../../static/evening-mountains.jpg;
in
''
# See https://wiki.hyprland.org/Configuring/Keywords/ for more
$mainMod = SUPER

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = $mainMod, return, exec, kitty
bind = $mainMod SHIFT, Q, killactive, 
bind = $mainMod, X, exec, swaylock -i ${bgImage}
bind = $mainMod, M, exit, 
bind = $mainMod, E, exec, dolphin
bind = $mainMod, V, togglefloating, 
bind = $mainMod, D, exec, wofi --show drun
bind = $mainMod, P, pseudo, # dwindle
#bind = $mainMod, J, togglesplit, # dwindle

# Move focus with mainMod + arrow keys
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d
bind = $mainMod, H, movefocus, l
bind = $mainMod, L, movefocus, r
bind = $mainMod, K, movefocus, u
bind = $mainMod, J, movefocus, d

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Moonlander keybindings
bind = $mainMod_ALT_SHIFT_CTRL, H, workspace, 1
bind = $mainMod_ALT_SHIFT_CTRL, J, workspace, 2
bind = $mainMod_ALT_SHIFT_CTRL, K, workspace, 3
bind = $mainMod_ALT_SHIFT_CTRL, L, workspace, 4
bind = $mainMod_ALT_SHIFT_CTRL, ;, workspace, 5
bind = $mainMod_ALT_SHIFT_CTRL, Y, workspace, 6
bind = $mainMod_ALT_SHIFT_CTRL, U, workspace, 7
bind = $mainMod_ALT_SHIFT_CTRL, I, workspace, 8
bind = $mainMod_ALT_SHIFT_CTRL, O, workspace, 9
bind = $mainMod_ALT_SHIFT_CTRL, P, workspace, 10
bind = ALT_SHIFT_CTRL, H, movetoworkspacesilent, 1
bind = ALT_SHIFT_CTRL, J, movetoworkspacesilent, 2
bind = ALT_SHIFT_CTRL, K, movetoworkspacesilent, 3
bind = ALT_SHIFT_CTRL, L, movetoworkspacesilent, 4
bind = ALT_SHIFT_CTRL, ;, movetoworkspacesilent, 5
bind = ALT_SHIFT_CTRL, Y, movetoworkspacesilent, 6
bind = ALT_SHIFT_CTRL, U, movetoworkspacesilent, 7
bind = ALT_SHIFT_CTRL, I, movetoworkspacesilent, 8
bind = ALT_SHIFT_CTRL, O, movetoworkspacesilent, 9
bind = ALT_SHIFT_CTRL, P, movetoworkspacesilent, 10


# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspacesilent, 1
bind = $mainMod SHIFT, 2, movetoworkspacesilent, 2
bind = $mainMod SHIFT, 3, movetoworkspacesilent, 3
bind = $mainMod SHIFT, 4, movetoworkspacesilent, 4
bind = $mainMod SHIFT, 5, movetoworkspacesilent, 5
bind = $mainMod SHIFT, 6, movetoworkspacesilent, 6
bind = $mainMod SHIFT, 7, movetoworkspacesilent, 7
bind = $mainMod SHIFT, 8, movetoworkspacesilent, 8
bind = $mainMod SHIFT, 9, movetoworkspacesilent, 9
bind = $mainMod SHIFT, 0, movetoworkspacesilent, 10

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

# Clipboard management
#bind = SUPER, V, exec, clipman pick -t wofi
''
