{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.nvim;

in {
    options.modules.nvim = { enable = mkEnableOption "nvim"; };
    config = mkIf cfg.enable {
        programs.neovim = 
        let
            toLua = str: "lua << EOF\n${str}\nEOF\n";
            toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
        in
        {
            enable = true;

            viAlias = true;
            vimAlias = true;
            vimdiffAlias = true;

            extraPackages = with pkgs; [
            ];

            plugins = with pkgs.vimPlugins; [
                {
                    plugin = nvim-lspconfig;
                    config = toLuaFile ./
                }
            ]
        };
    };
}
