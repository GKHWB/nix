{ pkgs, ... }:

{
  imports =
  [
    ./gdm.nix
    ./pam.nix
    ./niri-enable.nix
    ./stylix.nix
  ];

  environment.systemPackages = with pkgs; [
    hyprlock
    nautilus
  ];
}
