{ config, lib, inputs, system, ... }:

{
	imports = [
        inputs.nix-colors.homeManagerModules.default
		./../../../../modules/user/default.nix 
		./home.nix
	];
	config = {
        colorScheme = {
            slug = "rpm";
            name = "rpm";
            author = "Ryan Martel";
            palette = {
                base00 = "#151718";
                base01 = "#19181c";
                base02 = "#353535";
                base03 = "#4A4A4A";
                base04 = "#B2CCD6";
                base05 = "#EEFFFF";
                base06 = "#EEFFFF";
                base07 = "#FFFFFF";
                base08 = "#F07178";
                base09 = "#F78C6C";
                base0A = "#FFCB6B";
                base0B = "#C3E88D";
                base0C = "#89DDFF";
                base0D = "#82AAFF";
                base0E = "#C792EA";
                base0F = "#FF5370";
                # base00 = "#1d2021";
                # base01 = "#3c3836";
                # base02 = "#504945";
                # base03 = "#665c54";
                # base04 = "#bdae93";
                # base05 = "#d5c4a1";
                # base06 = "#ebdbb2";
                # base07 = "#fbf1c7";
                # base08 = "#fb4934";
                # base09 = "#fe8019";
                # base0A = "#fabd2f";
                # base0B = "#b8bb26";
                # base0C = "#8ec07c";
                # base0D = "#83a598";
                # base0E = "#d3869b";
                # base0F = "#d65d0e";
            };
        };

		modules = {
			# GUI
            discord.enable = true;

			# CLI
			kitty.enable = true;	
			git.enable = true;
			bash.enable = false;
			nvim.enable = true;
			zsh.enable = true;
            direnv.enable = true;

			# SYSTEM
			packages.enable = true;
			hyprland.enable = true;
		};
	};
}
