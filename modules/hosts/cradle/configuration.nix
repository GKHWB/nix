{ self, inputs, ...}: {

  flake-file.inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  flake.nixosModules.cradleConfiguration = { config, pkgs, ... }:

  {
    imports =  [
        self.nixosModules.cradleHardware
        self.modules.nixos.alter
        self.modules.nixos.desktop
        self.modules.nixos.searxng
        self.modules.nixos.steam
        self.modules.nixos.cliTools
        self.modules.nixos.videosuite
        self.modules.nixos.glide
        self.modules.nixos.zen-browser
        self.modules.nixos.secrets
        self.modules.nixos.artPrograms
        self.modules.nixos.secrets
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  
    networking.hostName = "cradle";   

    # Enable networking
    networking.networkmanager.enable = true;
  
    # Set your time zone.
    time.timeZone = "America/New_York";
  
    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";
  
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  
    # Enable the X11 windowing system.
    services.xserver.enable = true;
  
    # Enable the GNOME Desktop Environment.
    services.displayManager.gdm.enable = true;
  
    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };
  
    # Enable CUPS to print documents.
    services.printing.enable = true;
  
    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;
  
    # Install firefox.
    programs.firefox.enable = true;
  
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;
  
    environment.systemPackages = with pkgs; [
      jellyfin-tui
    ];

    # Add cuda to obs
    programs.obs-studio = {
      package = (pkgs.obs-studio.override {
          cudaSupport = true;
        });
    };
  
    # Enable the OpenSSH daemon.
    services.openssh.enable = true;

    age.secrets = {
      wireguardEndpoint = {
        file = "${self.inputs.secrets}/wireguard-endpoint.age";
      };
      wgPrivateKey = {
        file = "${self.inputs.secrets}/cradle-wg-key.age";
      };
    };

    system.activationScripts."wireguard-endpoint" = ''
      echo $(cat ${config.age.secrets.wireguardEndpoint.path}) > /etc/wireguard-endpoint
    '';
  
    networking.wireguard = {
      enable = true;
      interfaces = {
        wg0 = {
          ips = [ "192.168.3.2/32" ];
          listenPort = 5553;
          privateKeyFile = config.age.secrets.wgPrivateKey.path;
          peers = [
            {
              name = "asylum";
              publicKey = "CcCv3t8o9S4VphF0Mu7AyxOjMeDp8SdQnw0xA+gTGlo=";
              allowedIPs = [
                "192.168.3.1/32"
              ];
              endpoint = "$(${pkgs.coreutils}/bin/cat /etc/wireguard-endpoint):5554";
            }
          ];
        };
      };
    };

    networking.firewall.allowedUDPPorts = [
      5554
    ];
  
    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "26.11"; # Did you read the comment?
  
  };

}
