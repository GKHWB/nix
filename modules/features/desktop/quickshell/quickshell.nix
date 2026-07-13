{ self, inputs, ...}:

{
  perSystem = { pkgs, lib, ... }: {

    packages.quickshell = inputs.wrapper-modules.wrappers.quickshell.wrap {
      
      inherit pkgs;

      configDir = "${./quickshell-config}";

    };

  };
}
