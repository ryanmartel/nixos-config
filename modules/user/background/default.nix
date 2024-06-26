{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.background;

in {
    options.modules.background = { enable = mkEnableOption "background"; };
    config = mkIf cfg.enable {
        
        bgImage = mkOption {
            type = types.lines;
            default = ../../../../static/deep-ocean.jpg;
            description = ''
                Configuration for background image.
            '';
        };
    };
}
