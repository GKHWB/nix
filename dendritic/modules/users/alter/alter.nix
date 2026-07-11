{ self, inputs, ...}:

{
  flake.modules.nixos.alter = {
    imports = [
    ];

    users.users."alter" = { config, pkgs, ...}: 
    {
      isNormalUser = true;
      description = "alter";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
      ];
    };

  };
}
