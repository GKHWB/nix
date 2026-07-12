{ self, inputs, ...}: {
  flake.nixosConfigurations.cradle = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.cradleConfiguration
    ];
  };
}
