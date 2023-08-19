{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.zsh;

in {
    options.modules.zsh = { enable = mkEnableOption "zsh"; };
    config = mkIf cfg.enable {
        programs.zsh = {
            enable = true;
            enableCompletion = true;
            enableAutosuggestions = true;
            enableVteIntegration = true;
            oh-my-zsh = {
                enable = true;
                theme = "af-magic";
            };
        };
    };
}
