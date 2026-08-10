{ self, input, ... }:

{
  flake.modules.nixos.cliTools = { pkgs, ... }: {
    imports = [
      self.modules.nixos.nixvim
    ];

    environment.systemPackages = with pkgs; [
      git
      lazygit
      ripgrep
      fd
      tealdeer
      self.packages.${pkgs.stdenv.hostPlatform.system}.tmux
      dust
      unzip
      htop
      man-pages
      man-pages-posix
    ];
  };
}
