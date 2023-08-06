{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.nvim;

in {
    options.modules.nvim = { enable = mkEnableOption "nvim"; };
    config = mkIf cfg.enable {
	programs.nixvim = {

        # General
	    globals.mapleader = " ";
        viAlias = true;
        vimAlias = true;
	    enable = true;

	    # Make it pretty
	    colorschemes.tokyonight = {
	    	enable = true;
		transparent = true;
		style = "night";
	    };

        extraConfigLua = ''
        vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
        '';

	    # Options
		options = {
			number = true;
			relativenumber = true;
			
			shiftwidth = 4;
			expandtab = true;
			tabstop = 4;
			softtabstop = 4;

			smartindent = true;
			
			swapfile = false;
			backup = false;
			undofile = true;

			hlsearch = false;
			incsearch = true;

			scrolloff = 8;
			updatetime = 50;
		};

	    # General HOTKEY MAPPING
	    maps = {
            # Harpoon
            normal."<C-e>" = { action = ''<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>''; };

            # File explorer
            normal."<leader>e" = { action = "<cmd>Ex<CR>"; };
            # Telescope
            normal."<leader>ff" = { action = "<cmd>Telescope find_files<CR>"; };
            normal."<leader>fg" = { action = "<cmd>Telescope git_files<CR>"; };
            normal."<leader>fs" = { action = ''<cmd>lua require("telescope.builtin").grep_string({search = vim.fn.input("Grep > ")})<CR>''; };
            # UndoTree
            normal."<leader>v" = { action = "<cmd>UndotreeToggle<CR>"; };
            # Fugitive
            normal."<leader>gs" = { action = "<cmd>Git<CR>"; };

            # Vim Navigation and editing
            insert."jk" = "<ESC>";
            
            visual."J" = { action = ":m '>+1<CR>gv=gv"; };
            visual."K" = { action = ":m '<-2<CR>gv=gv"; };
            
            normal."J" = "mzJ`z";
            normal."<C-d>" = "<C-d>zz";
            normal."<C-u>" = "<C-u>zz";
            normal."n" = "nzzzv";
            normal."N" = "Nzzzv";
    
            visualOnly."<leader>p" = ''"_dP'';
            normal."<leader>y" = ''"+y'';
            visual."<leader>y" = ''"+y'';
            normal."<leader>Y" = ''"+Y'';

            normal."<leader>d" = ''"_d'';
            visual."<leader>d" = ''"_d'';

            normal."Q" = "<nop>";
            normal."<leader>s" = { action = '':%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>''; };


	    };
	    # Plugins
	    plugins = {
#auto-save.enable = true;
            fugitive.enable = true;
            treesitter.enable = true;
            telescope.enable = true;
            trouble.enable = true;
            undotree.enable = true;
            nvim-autopairs.enable = true;
            lualine.enable = true;
            harpoon = {
                enable = true;
                keymaps = {
                    addFile = "<leader>a";
#cmdToggleQuickMenu = "<C-e>"; broken
                    navFile = { "1" = "<C-h>"; "2" = "<C-j>"; "3" = "<C-k"; "4" = "<C-l>"; };
                };
            };
            treesitter-context = {
                enable = true;
                maxLines = 1;
            };
            presence-nvim = {
                enable = true;
            };
# LSP 
            lsp = {
                enable  = true;
                servers = {
                    clangd.enable = true;
                    cmake.enable = true;
                    gopls.enable = true;
                    html.enable = true;
# BROKEN?		java-language-server.enable = true;
                    jsonls.enable = true;
                    nixd.enable = true;
                    pylsp.enable = true;
                    rust-analyzer.enable = true;
                };
                onAttach = ''
                    local opts = {buffer = bufnr, remap = false}
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
                    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
                    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
                    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
                    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
                    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
                    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
                    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
                    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
                    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
                    '';
            };
#rust-tools.enable = true;
            cmp-nvim-lsp.enable = true;
            cmp-buffer.enable = true;
            cmp-path.enable = true;
            cmp_luasnip.enable = true;
            cmp-nvim-lua.enable = true;
            luasnip.enable = true;
            nvim-cmp = {
                enable = true;
                mapping = {
                    "<C-y>" = "cmp.mapping.confirm({ select = true })";
                    "<C-n>" = "cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select})";
                    "<C-p>" = "cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select})";
                    "<C-Space>" = "cmp.mapping.complete()";
                };
                snippet.expand = "luasnip";
                sources = [
                { name = "nvim_lsp"; }
                { name = "luasnip"; }
                { name = "path"; }
                { name = "buffer"; }
                ];
            };
            toggleterm = {
                enable = true;
                direction = "float";
                openMapping = "<A-1>";
            };
	    };
	};
    };
}
