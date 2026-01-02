{ pkgs, inputs, ...}:

{
  environment.systemPackages = with pkgs; [
    fd
    dust
    egl-wayland
    pavucontrol
    tealdeer
    htop
    ripgrep
    mpv
    freetube
    foliate
    yt-dlp
    deno
    feh
    git
    killall
    unzip
    inputs.zen-browser.packages.${pkgs.system}.twilight
    inputs.glide.packages.${pkgs.system}.glide-browser
    vlc
    obsidian
    racket
    pomodoro-gtk
    cargo
    rustc
    rustfmt
    clang
    man-pages
    man-pages-posix
    tutanota-desktop
    lazygit
    gparted
    tmux
    xwayland-satellite
    vesktop
    fastfetch
    cbonsai
    krita
    cava
    wonderdraft
    #(callPackage ./misc/jellyfin-tui.nix {})
    jellyfin-tui
    playerctl
    #jellyfin-media-player
    nushell
    zathura
    libreoffice
  ];

  fonts.packages = with pkgs; [
    font-awesome
    ipafont
    kochi-substitute
  ];

  fonts.fontconfig.defaultFonts = {
  monospace = [
    "DejaVu Sans Mono"
    "IPAGothic"
  ];
  sansSerif = [
    "DejaVu Sans"
    "IPAGothic"
  ];
  serif = [
    "DejaVu Serif"
    "IPAPMincho"
  ];
  };
}
