{config, lib, inputs, ...}:

{
    imports = [
        ./configuration.nix
        ./hardware-configuration.nix
        ./../../../modules/system/default.nix
    ];
    config.modules = {
        zsh.enable = true;
        packages.enable = true;
    };
