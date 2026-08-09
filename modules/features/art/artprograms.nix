{
  flake.modules.nixos.artPrograms = { pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      krita
      blockbench
      aseprite
    ];
  };
}
