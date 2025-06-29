{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.nushell}/bin/nu";
    newSession = true;
    extraConfig="set -gq allow-passthrough on\nset -g visual-activity off";
  };
}
