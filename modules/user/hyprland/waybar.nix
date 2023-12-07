{
    mainBar = {
        layer = "top";
        position = "top";
        height = 32;
        modules-left = [ "hyprland/workspaces" "hyprland/submap"];
        modules-center = [ "clock" ];
        modules-right = [ "network" "battery" ];

        "hyprland/submap" = {
            format = " {}";
        };

        "hyprland/workspaces" = {
            disable-scroll = true;
            format = "{id}";
        };

        "hyprland/window" = {
            max-length = 80;
            tooltip = false;
        };

        "clock" = {
            format = "{:%a %d %b %H:%M}";
			tooltip = false;
        };

		"network" = {
			format-ethernet = "";
			format-disconnected = "󰌙";
            format-wifi = "{icon}";
            format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
			tooltip-format = "{ipaddr} / {cidr}";
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
