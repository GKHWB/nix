{ config, pkgs, ... }: {
	home = {
		username = "studying";
		homeDirectory = "/home/studying";
		packages = [
		];
		stateVersion = "24.11";
	};

	# Kitty Config
	programs.kitty = {
		enable = true;
		settings = {
			background_blur = 1;
			shell = "fish";
		};
	};

	services.swaync.enable = true;
	gtk.enable = true;

	imports = [
		./shells/bundle.nix
		./wm/bundle.nix
	];

}
