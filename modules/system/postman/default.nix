{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.postman;
          pname = "postman";
          version = "10.18.0";
          meta = with lib; {
            homepage = "https://www.getpostman.com";
            description = "API Development Environment";
            sourceProvenance = with sourceTypes; [ binaryNativeCode ];
            license = licenses.postman;
            platforms = [ "x86_64-linux" ];
            maintainers = with maintainers; [ johnrichardrinehart evanjs tricktron Crafter ];
          };
in {
    options.modules.postman = { enable = mkEnableOption "postman"; };
    config = mkIf cfg.enable {
        environment.systemPackages = [
            pkgs.callPackage ./linux.nix { inherit pname version meta; }
        ];
    };
}
