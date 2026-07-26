{ self, inputs, ...}: {
  flake.nixosConfigurations.asylum= inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.asylumConfiguration
    ];
  };
}
