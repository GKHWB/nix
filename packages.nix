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
    (callPackage ./misc/jellyfin-tui.nix {})
    playerctl
    jellyfin-media-player
    nushell
    zathura
  ];

  fonts.packages = with pkgs; [
    font-awesome
  ];

}
