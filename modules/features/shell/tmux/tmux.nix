{ self, inputs, ... }:

{
  perSystem  = { pkgs, ...}: {
    packages.tmux = inputs.wrapper-modules.wrappers.tmux.wrap {
      inherit pkgs;
      modeKeys = "vi";
      shell = "${pkgs.nushell}/bin/nu";
    };
  };
}
