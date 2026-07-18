{ self, lib, ...}: 

{
  flake.modules.nixos.desktop = {
    imports = [
      self.nixosModules.niri
      self.modules.nixos.audio
      self.modules.nixos.inputMethod
    ];
  };
}
