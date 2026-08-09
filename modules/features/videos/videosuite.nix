{ self, inputs, ...}:

{
  flake.modules.nixos.videosuite = { pkgs, ... }:
  {
    environment.systemPackages = with pkgs; [
      kdePackages.kdenlive
    ];
    programs.obs-studio = {
      enable = true;
      plugins = with pkgs; [
        obs-studio-plugins.obs-pipewire-audio-capture
      ];
    };
  };
}
