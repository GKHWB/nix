{ pkgs, ... }:

{
  # Stylix Config
  stylix = {
    enable = true;
    image = ./Wallpapers/OccidentalEyeWallpaper.jpg;
    polarity = "dark";
    base16Scheme = ./occidental-eye.yaml;
    opacity.terminal = 1.00;
    cursor.name = "Quintom_Ink";
    cursor.package = pkgs.quintom-cursor-theme;
    cursor.size = 16;
  };

}
