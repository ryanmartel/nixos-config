{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.spotify;

in {
    options.modules.spotify = { enable = mkEnableOption "spotify"; };
    config = mkIf cfg.enable {
        environment.system.Packages = with pkgs; [
            spotify
        ];
    };
}
