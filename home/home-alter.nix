{ inputs, pkgs, ... }:

{

	imports = [
		./shells/bundle.nix
		./wm/bundle.nix
                inputs.vicinae.homeManagerModules.default
	];

        services.vicinae = {
          enable = true;
          autoStart = true;
        };

	home = {
		username = "alter";
		homeDirectory = "/home/alter";
		packages = [
		];
		stateVersion = "24.11";
	};

	# Kitty Config
	programs.kitty = {
		enable = true;
		environment = {
		  "EDITOR" = "nvim";
		};
		settings = {
			shell = "nu";
		};
	};

        programs.mpv = {
	  enable = true;
	  config = {
	    volume = 50;
	    cache = "yes";
	  };
	};

	programs.lutris = {
	  enable = true;
	  winePackages = with pkgs; [
	    wine
	  ];
	};

	services.swaync.enable = true;
	gtk.enable = true;

}
