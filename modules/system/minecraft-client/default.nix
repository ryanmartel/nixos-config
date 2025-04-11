{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.minecraft_client;

in {
    options.modules.minecraft_client = { enable = mkEnableOption "minecraft_client"; };
    config = mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
            prismlauncher
        ]
    };
}
