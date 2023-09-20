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
                rnix-lsp
                rust-analyzer
                luajitPackages.lua-lsp
                nodePackages.eslint
                clang-tools
                java-language-server
            ];

            extraLuaConfig = ''
                vim.g.mapleader = " "
                ${builtins.readFile ./lua/options.lua}
                ${builtins.readFile ./lua/remap.lua}
            '';

            plugins = with pkgs.vimPlugins; [
                nvim-lspconfig
                nvim-cmp
                trouble-nvim

                luasnip
                cmp-path
                cmp-buffer
                cmp_luasnip
                cmp-nvim-lsp
                nvim-web-devicons
                {
                    plugin = lsp-zero-nvim;
                    config = toLuaFile ./lua/plugins/lsp.lua;
                }

                {
                    plugin = tokyonight-nvim;
                    config = toLua ''
                        require("tokyonight").setup({style="night", transparent=true})
                        vim.cmd[[colorscheme tokyonight]]
                    '';
                }
                {
                    plugin = (nvim-treesitter.withPlugins (p: [
                        p.tree-sitter-nix
                        p.tree-sitter-vim
                        p.tree-sitter-bash
                        p.tree-sitter-lua
                        p.tree-sitter-python
                        p.tree-sitter-json
                        p.tree-sitter-java
                        p.tree-sitter-c
                        p.tree-sitter-cmake
                        p.tree-sitter-cpp
                        p.tree-sitter-css
                        p.tree-sitter-dockerfile
                        p.tree-sitter-go
                        p.tree-sitter-html
                        p.tree-sitter-javascript
                        p.tree-sitter-make
                        p.tree-sitter-rust
                        p.tree-sitter-sql
                    ]));
                    config = toLuaFile ./lua/plugins/treesitter.lua;
                }
                {
                    plugin = nvim-treesitter-context;
                    config = toLua ''require("treesitter-context").setup{enable=true, max_lines=1,}'';
                }
                {
                    plugin = undotree;
                }
                {
                    plugin = harpoon;
                    config = toLuaFile ./lua/plugins/harpoon.lua;
                }
                {
                    plugin = telescope-nvim;
                    config = toLuaFile ./lua/plugins/telescope.lua;
                }
                {
                    plugin = vim-fugitive;
                }
                {
                    plugin = lualine-nvim;
                    config = toLua ''require("lualine").setup()'';
                }
                {
                    plugin = toggleterm-nvim;
                    config = toLuaFile ./lua/plugins/toggleterm.lua;
                }
                {
                    plugin = comment-nvim;
                    config = toLua ''require("Comment").setup()'';
                }
                {
                    plugin = nvim-autopairs;
                    config = toLua ''require("nvim-autopairs").setup()'';
                }
                /* {
                    plugin = nvim-jdtls;
                    config = toLuaFile ./lua/plugins/jdtls.lua;
                } */
            ];
        };
    };
}
