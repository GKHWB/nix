{ pkgs, ... }:

{
  # Stylix Config
  stylix = {
    enable = true;
    image = ./Wallpapers/blackandwhitegirl.png;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-venom.yaml";
    opacity.terminal = 0.75;
    cursor.name = "Quintom_Ink";
    cursor.package = pkgs.quintom-cursor-theme;
    cursor.size = 16;
  };

}
