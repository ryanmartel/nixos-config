{ config, lib, inputs, system, ... }:

{
    imports = [
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
            kitty.enable = true;
        };
    };
}
