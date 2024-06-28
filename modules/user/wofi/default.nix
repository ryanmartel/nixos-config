{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.wofi;

in {
    options.modules.wofi = { enable = mkEnableOption "wofi"; };
    config = mkIf cfg.enable {
        programs.wofi = {
            enable = true;
            style = ''
                * {
                    all: unset;
                    font-family: "JetBrainsMono";
                    font-size: 16px;
                }

                #window {
                    background-color: #${config.colorScheme.palette.base02};
                    border-radius: 12px;
                }

                #outer-box {
                    background-color: #${config.colorScheme.palette.base02};
                    border: 4px solid #${config.colorScheme.palette.base07};
                    border-radius: 12px;
                }

                #input{
                    margin: 1rem;
                    padding: 0.5rem;
                    border-radius: 10px;
                    background-color: #${config.colorScheme.palette.base03};
                }

                #entry {
                    margin: 0.25rem 0.75rem 0.25rem 0.75rem;
                    padding: 0.25rem 0.75rem 0.25rem 0.75rem;
                    color: #${config.colorScheme.palette.base07};
                    border-radius: 8px;
                }

                #entry:selected {
                    background-color: #${config.colorScheme.palette.base03};
                    color: #${config.colorScheme.palette.base0F};
                }
            '';
        };
    };
}
