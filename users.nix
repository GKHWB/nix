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

}
