{ self, inputs, ...}:

{
  flake-file.inputs.glide = {
    url = "github:glide-browser/glide.nix";
  };

  flake.modules.nixos.glide = { pkgs, ...}: {
    environment.systemPackages = [
      self.inputs.glide.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
