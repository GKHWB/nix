{ self, inputs, ...}: {

  flake.nixosModules.asylumConfiguration = { config, pkgs, ... }:

  {
    imports =  [
        self.nixosModules.asylumHardware
        self.modules.nixos.alter
        self.modules.nixos.cliTools
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Bootloader.
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/sdb";
    boot.loader.grub.useOSProber = true;
  
    networking.hostName = "asylum"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  
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
  
    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };
  
    environment.systemPackages = with pkgs; [
      qbittorrent-nox
    ];
  
    # Enable the OpenSSH daemon.
    services.openssh = {
      enable = true;
      settings = { 
        PasswordAuthentication = false;
      }; 
    };

    #Jellyfin
    services.jellyfin = {
      enable = true;
      cacheDir = "/mnt/jellyfin/cache";
      configDir = "/mnt/jellyfin/config";
      dataDir = "/mnt/jellyfin/data";
    };

    #Wireguard setup
    networking.wireguard = {
      enable = true;
      interfaces = {
        wg0 = {
          ips = [ "192.168.2.1/24" ];
          listenPort = 5553;
          privateKeyFile = "/mnt/wg-private";
          peers = [
            {
              name = "phone";
              publicKey = "vocKGYkTMbmFZ1wda5G3lOAgFtZI3LDuTMA6b7lUuTY=";
              allowedIPs = [
                "192.168.2.2/32"
              ];
            }
          ];
          postSetup = ''
            ${pkgs.iptables}/bin/iptables -A FORWARD -i wg0 -j ACCEPT
            ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 192.168.1.1/24 -o eno4 -j MASQUERADE
          '';
          postShutdown = ''
            ${pkgs.iptables}/bin/iptables -D FORWARD -i wg0 -j ACCEPT
            ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 192.168.1.1/24 -o eno4 -j MASQUERADE
          '';
        };
      };
    };

    networking.nat = {
      enable = true;
      externalInterface = "eno4";
      internalInterfaces = [ "wg0" ];
    };

    # Open ports in the firewall.
    networking.firewall.interfaces.eno4.allowedTCPPorts =
    [
      8081
      8082
      42920
      42921
      8096
    ];

    networking.firewall.interfaces.eno4.allowedUDPPorts =
    [
      5553
    ];

    networking.firewall.trustedInterfaces = 
    [
      "wg0"
    ];

    # Or disable the firewall altogether.
    # networking.firewall.enable = false;
  
    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "26.11"; # Did you read the comment?
  
  };
}
