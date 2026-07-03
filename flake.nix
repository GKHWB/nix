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
		};

		zen-browser = {
			url = "github:0xc000022070/zen-browser-flake";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		niri.url = "github:sodiboo/niri-flake";

                vicinae.url = "github:vicinaehq/vicinae";

                glide.url = "github:glide-browser/glide.nix";

                nix-index-database = {
                  url = "github:nix-community/nix-index-database";
                  inputs.nixpkgs.follows = "nixpkgs";
                };
	};

	outputs = { nixpkgs, home-manager, stylix, nixvim, niri, nix-index-database, ... }@inputs:
		let
			system = "x86_64-linux";
		in {
		# Laptop Config
		nixosConfigurations.amalgam = nixpkgs.lib.nixosSystem {
			inherit system;
			modules = [
			./amalgam-configuration.nix
			home-manager.nixosModules.home-manager {
			  home-manager.extraSpecialArgs = { inherit inputs; };
			}
			stylix.nixosModules.stylix
			nixvim.nixosModules.nixvim
			niri.nixosModules.niri
                        nix-index-database.nixosModules.default
                        { programs.nix-index-database.comma.enable = true; }
			];
			specialArgs = {
			inherit inputs;
			inherit niri;
			};
		};

		# PC Config
		nixosConfigurations.cradle = nixpkgs.lib.nixosSystem {
			inherit system;
			modules = [
			./cradle-configuration.nix
			home-manager.nixosModules.home-manager {
                          home-manager.extraSpecialArgs = { inherit inputs; };
                        }
			stylix.nixosModules.stylix
			nixvim.nixosModules.nixvim
			niri.nixosModules.niri
                        nix-index-database.nixosModules.default
                        { programs.nix-index-database.comma.enable = true; }
			];
			specialArgs = {
			inherit inputs;
			inherit niri;
			};
		};
	};

}
