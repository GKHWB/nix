{

	description = "My system configuration";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		stylix.url = "github:danth/stylix";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, stylix, nixvim, ... }@inputs:
		let
			system = "x86_64-linux";
		in {
		# Laptop Config
		nixosConfigurations.amalgam = nixpkgs.lib.nixosSystem {
			inherit system;
			modules = [
			./amalgam/configuration.nix
			home-manager.nixosModules.home-manager
			stylix.nixosModules.stylix
			nixvim.nixosModules.nixvim
			];
		};

		# PC Config
		nixosConfigurations.cradle = nixpkgs.lib.nixosSystem {
			inherit system;
			modules = [
			./cradle/configuration.nix
			home-manager.nixosModules.home-manager
			stylix.nixosModules.stylix
			nixvim.nixosModules.nixvim
			];
		};
	};

}
