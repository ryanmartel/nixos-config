{ pkgs, lib, config, ... }:

with lib;
let cfg = config.background;
bg = ../../../static/deep-ocean.jpg;

in {
    options.background = { 

        bgImage = mkOption {
            type = types.str;
            default = ''${bg}'';
            description = ''
                Configuration for background image.
                '';
        };
    };
}
