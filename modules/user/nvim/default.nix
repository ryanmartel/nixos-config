{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.nvim;

in {
    options.modules.nvim = { enable = mkEnableOption "nvim"; };
    config = mkIf cfg.enable {
        home.file.".config/nvim/ftplugin/java.lua".source = ./lua/plugins/jdtls.lua;

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
                zls
                rust-analyzer
                luajitPackages.lua-lsp
                eslint
                metals
                coursier
                clang-tools
                # java-language-server
                vscode-langservers-extracted
                eslint_d
                nodePackages.typescript-language-server
                pyright
                # jdt-language-server
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
                nvim-jdtls
                vimsence
                nvim-metals
                plenary-nvim
                luasnip
                cmp-path
                cmp-buffer
                cmp_luasnip
                cmp-nvim-lsp
                lalrpop-vim
                nvim-web-devicons
                {
                    plugin = lsp-zero-nvim;
                    config = toLuaFile ./lua/plugins/lsp.lua;
                }

                # {
                #     plugin = tokyonight-nvim;
                #     config = toLua ''
                #         require("tokyonight").setup({style="night", transparent=true})
                #         vim.cmd[[colorscheme tokyonight]]
                #     '';
                # }
                {
                    plugin = base16-nvim;
                    config = toLua ''
                        require('base16-colorscheme').with_config({
                                telescope = false
                                })
                        require('base16-colorscheme').setup({
                            base00 = '#${config.colorScheme.palette.base00}',
                            base01 = '#${config.colorScheme.palette.base01}',
                            base02 = '#${config.colorScheme.palette.base02}',
                            base03 = '#${config.colorScheme.palette.base03}',
                            base04 = '#${config.colorScheme.palette.base04}',
                            base05 = '#${config.colorScheme.palette.base05}',
                            base06 = '#${config.colorScheme.palette.base06}',
                            base07 = '#${config.colorScheme.palette.base07}',
                            base08 = '#${config.colorScheme.palette.base08}',
                            base09 = '#${config.colorScheme.palette.base09}',
                            base0A = '#${config.colorScheme.palette.base0A}',
                            base0B = '#${config.colorScheme.palette.base0B}',
                            base0C = '#${config.colorScheme.palette.base0C}',
                            base0D = '#${config.colorScheme.palette.base0D}',
                            base0E = '#${config.colorScheme.palette.base0E}',
                            base0F = '#${config.colorScheme.palette.base0F}'
                        })
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
