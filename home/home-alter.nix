{ inputs, pkgs, ... }:

{

	imports = [
		./shells/bundle.nix
		./wm/bundle.nix
                inputs.vicinae.homeManagerModules.default
	];

        services.vicinae = {
          enable = true;
          systemd = {
            enable = true;
            autoStart = true;
          };
        };

	home = {
		username = "alter";
		homeDirectory = "/home/alter";
		packages = [
		];
		stateVersion = "24.11";
	};

        # Anki Config
        programs.anki = {
          enable = true;
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
          package = (pkgs.lutris.override {
            # Intercept buildFHSEnv to modify target packages
            buildFHSEnv = args: pkgs.buildFHSEnv (args // {
              multiPkgs = envPkgs:
                let
                  # Fetch original package list
                  originalPkgs = args.multiPkgs envPkgs;
          
                  # Disable tests for openldap
                  customLdap = envPkgs.openldap.overrideAttrs (_: { doCheck = false; });
                in
                # Replace broken openldap with the custom one
                builtins.filter (p: (p.pname or "") != "openldap") originalPkgs ++ [ customLdap ];
            });
          });
	  winePackages = with pkgs; [
	    wine
	  ];
	};

        programs.quickshell = {
          enable = true;
          configs = {
            "occidentaleye" = ./wm/quickshell;
          };
          activeConfig = "occidentaleye";
        };

        home.file = {
          ".config/vesktop/userAssets/tray" = {
            enable = true;
            force = true;
            source = ./assets/vesktopTray.png;
          };
          ".config/vesktop/userAssets/trayUnread" = {
            enable = true;
            force = true;
            source = ./assets/vesktopTrayUnread.png;
          };
        };

        #Notification daemon
	services.mako.enable = true;

	gtk.enable = true;

}
