{ pkgs, ... }:

{
  # Define user accounts. Don't forget to set a password with ‘passwd’.
  users.mutableUsers = true;
  users.users = {
    alter = {
      isNormalUser = true;
      description = "alter";
      homeMode = "750";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
      ];
    };
  };

  home-manager = {
     users = {
        "alter" = import ./home/home-alter.nix;
     };
     sharedModules = [{
       stylix.targets.hyprland.hyprpaper.enable = false;
     }];
  };
}
