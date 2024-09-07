{
    mainBar = {
        output = "DP-1";
        layer = "top";
        position = "top";
        height = 32;
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "cpu" "temperature" "memory" "disk" "pulseaudio" "network" "battery" "tray" ];

        "hyprland/workspaces" = {
            disable-scroll = true;
            format = "{id}";
        };

        "hyprland/window" = {
            max-length = 80;
            tooltip = false;
        };

        "tray" = {
            icon-size = 18;
            spacing = 5;
            show-passive-items = true;
        };

        "clock" = {
            interval = 60;
            format = "{:%a %d %b %H:%M}";
			tooltip = false;
        };

        "temperature" = {
            critical-threshold = 70;
            interval = 2;
            format = " {temperatureC}°C";
            format-icons = [ "🧊" "" "🔥" ];
        };

        "cpu" = {
            interval = 2;
            format = "  {usage}%";
            tooltip = false;
        };

        "memory" = {
            interval = 2;
            format = "  {}%";
        };

        "disk" = {
            interval = 45;
            format = "󰋊 {percentage_used}%";
        };

		"network" = {
			format-ethernet = "";
			format-disconnected = "󰌙";
            format-wifi = "{icon}";
            format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
			tooltip-format = "{ipaddr} / {cidr}";
            on-click = "kitty nmtui";
		};

        "pulseaudio" = {
            format = "{icon} {volume}%";
            format-bluetooth = "{icon} {volume}% 󰂯";
            format-bluetooth-muted = "󰖁 {icon} 󰂯";
            format-muted = "󰖁 {format_source}";
            format-source = "{volume}% ";
            format-source-muted = " ";
            format-icons = {
                "headphone" = "󰋋";
                "default" = [ "" " " " " ];
            };
            on-click = "pavucontrol";
        };

        "battery" = {
            bat = "BAT0";
            interval = 10;
            states = {
                warning = 30;
                critical = 15;
            };
            format = "{icon}";
            format-icons = {
                discharging = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
                charging = [ "󰢜" "󰂆" "󰂇" "󰂈" "󰢝" "󰢞" "󰂊" "󰂋"];
                full = [ "󰂅" ];
            };
        };
        # "wireplumber" = {
        #     format = "{volume}% {icon}";
        #     format-muted = "";
        #     on-click = "pavucontrol";
        #     format-icons = [ "" "" "" ];
        # };
    };
}
