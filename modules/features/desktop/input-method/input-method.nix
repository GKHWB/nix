{ self, lib, ...}:
{
  flake.modules.nixos.inputMethod = { pkgs, ... }: {
    i18n.inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        addons = with pkgs; [
          fcitx5-anthy
        ];
        waylandFrontend = true;
      };
    };
  };
}
