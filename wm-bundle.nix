{ pkgs, niri, ... }:

{
  imports =
  [
    ./gdm.nix
    ./pam.nix
    ./niri-enable.nix
    ./stylix.nix
  ];

  environment.systemPackages = with pkgs; [
    waybar
    wofi
    waypaper
    hyprlock
    nautilus
  ];
}
