# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, niri, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # Include Nixvim config
      ../misc/nixvim.nix
      #Include Niri nixos module
      niri.nixosModules.niri
    ];

  # Nvidia
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      open = true;
      nvidiaSettings = true;
    };
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        nvidia-vaapi-driver
	vaapiVdpau
	libvdpau-va-gl
      ];
    };
  };

  # Environment variables
  environment.variables = {
    GBM_BACKEND = "nvidia-drm";
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };

  # Hint Electron to run in Wayland
  #environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable Flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  networking.hostName = "cradle"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Toggle firewall
  networking.firewall.enable = false;

  # Enable SearXNG
  services.searx = {
    enable = true;
    redisCreateLocally = true;
    settings.server.secret_key = "test";
    settings.server.port = "8080";
    settings.server.bind_address = "0.0.0.0";
  };

  # Bluetooth stuff
  hardware.bluetooth = {
    enable = true;
  };
  services.blueman.enable = true;

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

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [ fcitx5-anthy ];
      waylandFrontend = true;
    };
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable GDM
  services.xserver.displayManager.gdm.enable = true;

  # Enable GNOME Keyring
  services.gnome.gnome-keyring.enable = true;

  # Enable Seahorse
  programs.seahorse.enable = true;

  # Configure PAM for hyprlock
  security.pam.services.hyprlock = {};

  # Enable Niri
  nixpkgs.overlays = [ niri.overlays.niri ];
  programs.niri = {
    enable = true;
    package = pkgs.niri-stable;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };


  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define user accounts. Don't forget to set a password with ‘passwd’.
  users.mutableUsers = true;
  users.users = {
    alter = {
      isNormalUser = true;
      description = "alter";
      homeMode = "750";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        vesktop
        fastfetch
        cbonsai
	krita
	cava
        wonderdraft
        (callPackage ../misc/jellyfin-tui.nix {})
	playerctl
	jellyfin-media-player
      ];
    };
    studying = {
      isNormalUser = true;
      description = "studying";
      homeMode = "750";
      initialPassword = "password";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
      ];
    };
  };

  home-manager = {
     users = {
        "alter" = import ./home/home-alter.nix;
	"studying" = import ./home/home-studying.nix;
     };
     sharedModules = [{
       stylix.targets.hyprland.hyprpaper.enable = false;
     }];
  };

  # Install dconf
  programs.dconf.enable = true;

  # Enable flatpak
  services.flatpak.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    fd
    dust
    egl-wayland
    waybar
    wofi
    swww
    waypaper
    hyprlock
    xfce.thunar
    pavucontrol
    tealdeer
    btop
    ripgrep
    mpv
    nvtopPackages.full
    freetube
    feh
    git
    killall
    unzip
    librewolf-bin
    inputs.zen-browser.packages.${pkgs.system}.twilight
    vlc
    obsidian
    racket
    pomodoro-gtk
    cargo
    rustc
    tutanota-desktop
    lazygit
    gparted
    tmux
    xwayland-satellite
  #  wget
  ];

  programs.steam.enable = true;

  fonts.packages = with pkgs; [
    font-awesome
  ];

  # Stylix Config
  stylix = {
    enable = true;
    targets.grub.useImage = true;
    image = ./wallpapersymlink;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-venom.yaml";
    opacity.terminal = 0.75;
    cursor.name = "Quintom_Ink";
    cursor.package = pkgs.quintom-cursor-theme;
    cursor.size = 16;
  };

  # Automatic garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = false;

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
  system.stateVersion = "24.11"; # Did you read the comment?

}
