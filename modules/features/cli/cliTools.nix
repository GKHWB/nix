{ self, input, ... }:

{
  flake.modules.nixos.cliTools = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      git
      lazygit
      vim
      ripgrep
      fd
      tealdeer
      self.packages.${pkgs.stdenv.hostPlatform.system}.tmux
    ];
  };
}
