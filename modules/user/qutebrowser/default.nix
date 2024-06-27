{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.qutebrowser;

in {
    options.modules.qutebrowser = { enable = mkEnableOption "qutebrowser"; };
    config = mkIf cfg.enable {
        programs.qutebrowser = {
            enable = true;
            settings = {
                colors = {
                    webpage.preferred_color_scheme = "${config.colorScheme.variant}";
                    tabs.bar.bg = "#${config.colorScheme.palette.base02}";
                    tabs = {
                        selected = {
                            even = {
                                fg = "#${config.colorScheme.palette.base0F}";
                                bg = "#${config.colorScheme.palette.base02}";
                            };
                            odd = {
                                fg = "#${config.colorScheme.palette.base0F}";
                                bg = "#${config.colorScheme.palette.base02}";
                            };
                        };
                        even = {
                            fg = "#${config.colorScheme.palette.base07}";
                            bg = "#${config.colorScheme.palette.base02}";
                        };
                        odd = {
                            fg = "#${config.colorScheme.palette.base07}";
                            bg = "#${config.colorScheme.palette.base02}";
                        };
                    };
                    statusbar.normal.bg = "#${config.colorScheme.palette.base02}";
                };
            };
        };
    };
}
