{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.zsh;

in {
    options.modules.zsh = { enable = mkEnableOption "zsh"; };
    config = mkIf cfg.enable {
        programs.zsh.enable = true;
        users.defaultUserShell = pkgs.zsh;
        environment.shells = with pkgs; [zsh];
    };
}
