''
# See https://wiki.hyprland.org/Configuring/Monitors/


# See https://wiki.hyprland.org/Configuring/Keywords/ for more

# Source a file (multi-file configs)
# source = ~/.config/hypr/myColors.conf

# Some default env vars.
env = XCURSOR_SIZE,24

# For all categories, see https://wiki.hyprland.org/Configuring/Variables/
input {
    kb_layout = us
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =

    follow_mouse = 1

    touchpad {
        natural_scroll = no
    }

    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
}

general {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    gaps_in = 5
    gaps_out = 5
    border_size = 2
    col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
    col.inactive_border = rgba(595959aa)

    layout = dwindle
}

decoration {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    rounding = 10
    #drop_shadow = yes
    #shadow_range = 4
    #shadow_render_power = 3
    #col.shadow = rgba(1a1a1aee)
    shadow {
        enabled = true
        range = 4
        render_power = 3
        color = 0x1a1a1aee
    }
    blur {
        enabled = yes
        size = 3
        passes = 1
    }
}


animations {
    enabled = yes

    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
}

dwindle {
    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = yes # you probably want this
}

master {
    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    # new_is_master = true
}

gestures {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    workspace_swipe = off
}

# Example per-device config
# See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
#device:epic-mouse-v1 {
#    sensitivity = -0.5
#}

device {
    name = epic-mouse-v1
    sensitivity = -0.5
}
bind=,XF86AudioMute, exec, wpctl set-mute #DEFAULT_SINK@ toggle
bind=,XF86AudioLowerVolume, exec, wpctl set-volume -l 1.0 @DEFAULT_SINK@ 5%-
bind=,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.0 @DEFAULT_SINK@ 5%+

''
