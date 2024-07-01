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
            };
        };
        modules = {
            git.enable = true;
            bash.enable = true;
            nvim.enable = true;
            zsh.enable = true;
            packages.enable = true;
            kitty.enable = true;
        };
    };
}
