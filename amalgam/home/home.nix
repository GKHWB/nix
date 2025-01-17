{ config, pkgs, ... }: {
	home = {
		username = "alter";
		homeDirectory = "/home/alter";
		packages = [
			pkgs.xfce.thunar
		];
		stateVersion = "24.11";
	};

	# Neovim Config
	#programs.neovim = {
		#enable = true;
		#defaultEditor = true;
	#};

	# Kitty Config
	programs.kitty = {
		enable = true;
		settings = {
			background_blur = 1;
		};
	};

	programs.librewolf.enable = true;
	services.swaync.enable = true;
	gtk.enable = true;

	imports = [
		./bash.nix
		./wm/bundle.nix
	];

}
