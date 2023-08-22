{
    mainBar = {
        layer = "top";
        position = "top";
        height = 32;
        modules-left = [ "hyprland/workspaces" "hyprland/submap"];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "clock" ];

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
            tooltip = true;
			tooltip-format = "\n<span size='9pt' font='JetBrainsMono'>{calendar}</span>";
			calendar = {
						mode          = "year";
						mode-mon-col  = 3;
						weeks-pos     = "right";
						on-scroll     = 1;
						on-click-right= "mode";
						format = {
								  months =     "<span color='#ffead3'><b>{}</b></span>";
								  days =       "<span color='#ecc6d9'><b>{}</b></span>";
								  weeks =      "<span color='#99ffdd'><b>W{}</b></span>";
								  weekdays=   "<span color='#ffcc66'><b>{}</b></span>";
								  today=      "<span color='#ff6699'><b><u>{}</u></b></span>";
								  };
			};
        };
    };
}
