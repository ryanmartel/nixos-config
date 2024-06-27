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
                    webpage.preferred_color_scheme = "${config.colorScheme.rpm}";
                };
            };
        };
    };
}
