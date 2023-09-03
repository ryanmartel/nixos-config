{ config, lib, inputs, system, ... }:

{
    imports = [
        inputs.nixvim.homeManagerModules.nixvim
        ./../../../../modules/user/default.nix
        ./home.nix
    ];
    config = {
        modules = {
            git.enable = true;
            bash.enable = true;
            nvim.enable = true;
            zsh.enable = true;
            packages.enable = true;
        };
    };
}
