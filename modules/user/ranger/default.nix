{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.ranger;

in {
    options.modules.ranger = { enable = mkEnableOption "ranger"; };
    config = mkIf cfg.enable {
        programs.ranger = {
            enable = true;
            extraConfig = ''
                set preview_images true
                set preview_images_method kitty 
            '';
        };
    };
}
