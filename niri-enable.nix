{ pkgs, niri, ... }:

{
  # Enable Niri
  nixpkgs.overlays = [ niri.overlays.niri ];
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };
}
