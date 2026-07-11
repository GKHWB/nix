{ self, inputs, ...}:

{

  flake.modules.nixos.alter = {
    imports = [
	self.modules.nixos.home-manager
    ];

    users.users."alter" = { config, pkgs, ...}: 
    {
      isNormalUser = true;
      description = "alter";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
      ];
    };

    home-manager.users.alter = {
      imports = [
        inputs.self.modules.homeManager.alter
      ];
      
    };


  };

  flake.modules.homeManager.alter = {
    home = {
      username = "alter";
      homeDirectory = "/home/alter";
      packages = [
      ];
      stateVersion = "26.11";
    };
  };

}
