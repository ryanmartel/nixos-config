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
                nvim-lspconfig
                nvim-cmp
                {
                    plugin = lsp-zero-nvim;
                    config = ./nvim/plugin/lsp.lua;
                }

                {
                    plugin = tokyonight-nvim;
                    config = ''require("tokyonight").setup({style="night", transparent=true})'';
                }
                vim-fugitive
                trouble-nvim
                undotree
                harpoon
                nvim-autopairs
                lualine-nvim
                telescope-nvim
                vimsence
                toggleterm-nvim
                nvim-treesitter
                nvim-treesitter-context
                comment-nvim
            ];
        };
    };
}
