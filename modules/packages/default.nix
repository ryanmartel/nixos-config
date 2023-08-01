{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.packages;

in {
    options.modules.packages = { enable = mkEnableOption "packages"; };
    config = mkIf cfg.enable {
	home.packages = with pkgs; [
		neofetch
		nnn #terminal file manager
		
		# archives
		zip
		unzip

		#utils
		ripgrep
		bat
		exa
		fzf

		#misc
		file
		which
		tree
		gnused
		gnutar
		gawk
		zstd
		gnupg
		
		#nix related
		#provides 'nom' works just like 'nix'
		# with detailed logs
		nix-output-monitor

		#productivity
		glow #markdown previewer in terminal
		btop
		iotop #io monitoring
		iftop #network monitoring

		#system call monitoring
		strace
		ltrace
		lsof #list open files

		#system tools
		sysstat
		lm_sensors
		ethtool
		pciutils #lspci
		usbutils #lsusb
	];

    };
}
