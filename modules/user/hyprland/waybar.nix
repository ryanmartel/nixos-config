{
    mainBar = {
        layer = "top";
        position = "top";
        height = 32;
        modules-left = [ "wlr/workspaces" "wlr/submap"];
        modules-center = [ "wlr/window" ];

        "wlr/submap" = {
            format = " {}";
        };

        "wlr/workspaces" = {
            disable-scroll = true;
            format = "{id}";
        };
    };
}
