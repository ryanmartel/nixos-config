{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.nvim;

in {
    options.modules.nvim = { enable = mkEnableOption "nvim"; };
    config = mkIf cfg.enable {
	programs.nixvim = {
	    globals.mapleader = " ";
	    enable = true;
	    # Make it pretty
	    colorschemes.tokyonight = {
	    	enable = true;
		transparent = true;
		style = "night";
	    };

	    # Options
		options = {
			number = true;
			relativenumber = true;
			shiftwidth = 4;
		};

	    # HOTKEY MAPPING
	    maps = {
		normal."<C-e>" = { action = ''<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>''; };
		normal."<leader>e" = { action = "<cmd>Ex<CR>"; };
		normal."<leader>ff" = { action = "<cmd>Telescope find_files<CR>"; };
		normal."<leader>fg" = { action = "<cmd>Telescope git_files<CR>"; };
		normal."<leader>fs" = { action = ''<cmd>lua require("telescope.builtin").grep_string({search = vim.fn.input("Grep > ")})<CR>''; };
		normal."<leader>v" = { action = "<cmd>UndotreeToggle<CR>"; };
		normal."<leader>gs" = { action = "<cmd>Git<CR>"; };

		insert."jk" = "<ESC>";
    
	    };
	    # Plugins
	    plugins = {
	    	fugitive.enable = true;
		harpoon = {
			enable = true;
			keymaps = {
			    addFile = "<leader>a";
			   #cmdToggleQuickMenu = "<C-e>"; broken
			    navFile = { "1" = "<C-h>"; "2" = "<C-j>"; "3" = "<C-k"; "4" = "<C-l>"; };
			};
		};
		treesitter.enable = true;
		treesitter-context = {
			enable = true;
			maxLines = 1;
		};
		telescope.enable = true;
		trouble.enable = true;
		undotree.enable = true;
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
		};
		lualine.enable = true;
	    };
	};
    };
}
