{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.nvim;

in {
    options.modules.nvim = { enable = mkEnableOption "nvim"; };
    config = mkIf cfg.enable {
	programs.nixvim = {
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

	    # Plugins
	    plugins = {
	    	fugitive.enable = true;
		harpoon = {
			enable = true;
		};
		treesitter.enable = true;
		treesitter-context = {
			enable = true;
			maxLines = 1;
		};
		telescope.enable = true;
		trouble.enable = true;
		undotree.enable = true;
		
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
