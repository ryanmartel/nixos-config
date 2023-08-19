{
	description = "Ryan's NixOS Flake";

	inputs = {

		# Official NixOS package source, using nixos-unstable branch here
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		# NVIM packages and configuration
		nixvim.url = "github:nix-community/nixvim";
		# Hyprland
		hyprland.url = "github:hyprwm/Hyprland";
		# home-manager, used for managing user configuration
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs@{ self, nixpkgs, home-manager, hyprland, nixvim, ... }:  
		let
			system = "x86_64-linux"; 
			pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
			lib = nixpkgs.lib;

	# Lets us reuse code to "create" a system
	mkSystem = pkgs: system: hostname:
		pkgs.lib.nixosSystem {
			system = system;
			modules = [
			{ networking.hostName = hostname; }
			(./. + "/hosts/${hostname}/system/system.nix")
			home-manager.nixosModules.home-manager
				{
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						extraSpecialArgs = { inherit inputs system; };
						users.ryan = (./. + "/hosts/${hostname}/users/ryan/user.nix");
					};
				}
			];

		};

	in {
		nixosConfigurations = {
			# Define Systems
			#							Architecture	Hostname
			RPM = mkSystem inputs.nixpkgs "x86_64-linux" "RPM";
		};
	};
}

