{
    mainBar = {
        layer = "top";
        position = "top";
        height = 32;
        modules-left = [ "hyprland/workspaces" "hyprland/submap"];
        modules-center = [ "clock" ];
        modules-right = [ "network" ];

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
			tooltip-format = "{ipaddr} / {cidr}";
		};
    };
}
