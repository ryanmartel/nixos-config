{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.nvim;

in {
  options.modules.nvim = { enable = mkEnableOption "nvim"; };
  config = mkIf cfg.enable {
    programs.nixneovim = {
      enable = true;
      viAlias = true;
#		colorschemes.tokyonight = {
#			enable = true;
#			style = "day";
#			transparent = true;
#		};
      options = {
	number = true; #show line numbers
	  relativenumber = true;
	shiftwidth = 4;
      };

      # KEY MAPS
      mappings = {
      };

      #PLUGINS
      plugins = {
	trouble {
	  enable = true;
	};
      };
    };
  };
}
