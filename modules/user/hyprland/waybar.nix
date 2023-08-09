
{
    mainBar = {
        layer = "top";
        position = "top";
        height = 32;
        modules-left = [ "hyprland/workspaces" "hyprland/submap"];
        modules-center = [ "hyprland/window" ];

        "hyprland/submap" = {
            format = " {}";
        };

        "hyprland/workspaces" = {
            disable-scroll = true;
            format = "{id}";
        };
    };
}
