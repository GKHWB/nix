{ self, inputs, ...}:

{
  flake-file.inputs.zen-browser = {
    url = "github:0xc000022070/zen-browser-flake";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.zen-browser = { pkgs, ...}: {
    environment.systemPackages = [
      self.inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.twilight
    ];
  };
}
