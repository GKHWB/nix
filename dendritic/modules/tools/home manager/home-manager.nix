{ self, inputs, ...}:

let
  home-manager-config =
  {
    home-manager = {
      verbose = true;
      useUserPackages = true;
      useGlobalPkgs = true;
      backupFileExtension = "backup";
      overwriteBackup = true;
    };
  };
in
{

  flake.modules.nixos.home-manager = {
    imports = [
      inputs.home-manager.nixosModules.default
      home-manager-config
    ];
  };

}
