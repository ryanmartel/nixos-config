
{
    mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "sway/workspaces" "sway/mode"];
        modules-center = [ "sway/window" ];

        "sway/mode" = {
            format = " {}";
        };

        "sway/workspaces" = {
            disable-scroll = true;
            format = "{name}";
        };
    };
}
