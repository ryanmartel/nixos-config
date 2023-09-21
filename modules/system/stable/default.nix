{ pkgs-stable, lib, config, ... }:

with lib;
let cfg = config.modules.stable;

in {
    options.modules.stable = { enable = mkEnableOption "stable"; };
    config = mkIf cfg.enable {
        environment.systemPackages = with pkgs-stable; [
            postman
        ];
    };
}
