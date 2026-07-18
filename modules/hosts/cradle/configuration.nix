{ self, inputs, ...}: {

  flake-file.inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  flake.nixosModules.cradleConfiguration = { config, pkgs, ... }:

  {
    imports =  [
        self.nixosModules.cradleHardware
        self.modules.nixos.alter
        self.modules.nixos.desktop
        self.modules.nixos.obs
        self.modules.nixos.searxng
        self.modules.nixos.steam
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
    services.xserver.displayManager.gdm.enable = true;
  
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
  
    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    ];
  
    # List services that you want to enable:
  
    # Enable the OpenSSH daemon.
    services.openssh.enable = true;
  
    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
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
