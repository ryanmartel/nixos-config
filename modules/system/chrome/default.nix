{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.chrome;

in {
    options.modules.chrome = { enable = mkEnableOption "chrome"; };
    config = mkIf cfg.enable {
        environment.systemPackages = [ pkgs.google-chrome ];
    };
}
