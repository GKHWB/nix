{ self, inputs, ...}:

{

  flake.nixosModules.niri = { pkgs, lib, ...}:
  {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };
  };

  perSystem = { pkgs, lib, ... }: {

    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {

      inherit pkgs;

      settings = {
        outputs = {
          "DP-1" = {
            position = _: {
              props = {
                x = 1920;
                y = 0;
              };
            };
          };
          "HDMI-A-1" = {
            position = _: {
              props = {
                x = 0;
                y = 0;
              };
            };
          };
        };
        prefer-no-csd = true;
        hotkey-overlay.skip-at-startup = true;
        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
        layout = {
          gaps = 16;
          preset-column-widths = [
            { proportion = 1. / 3.; }
            { proportion = 1. / 2.; }
            { proportion = 2. / 3.; }
            { proportion = 1.; }
          ];
          default-column-width = { proportion = 1. / 3.; };
        };
        cursor.hide-after-inactive-ms = 5000;
        spawn-at-startup = [
          [
            "${lib.getExe pkgs.swaybg}"
            "-i"
            "${./OccidentalEyeWallpaper.jpg}"
          ]
          [
            "${lib.getExe pkgs.vicinae}"
            "server"
          ]
        ];
        window-rules = [
          {
            matches = [
              { app-id = "^vesktop$"; }
              { app-id = "^zen-twilight$"; }
              { app-id = "^Godot$"; }
              { app-id = "^glide-glide$"; }
              { app-id = "^obsidian$"; }
            ];
            default-column-width = { proportion = 1.; };
          }
        ];
        binds = {
          #ToDo configure tmux so that kitty can open with -e tmux attach
          "Mod+Q".spawn-sh = "${lib.getExe pkgs.kitty}";
          "Mod+D".spawn-sh = "${lib.getExe pkgs.vicinae} toggle";
          #ToDo Glide stuff
          "Mod+E".spawn-sh = "nautilus";
          "Mod+F".spawn-sh = "${lib.getExe pkgs.freetube}";
          #ToDo quickshell stuff
          "Mod+Ctrl+L".spawn-sh = lib.getExe pkgs.hyprlock;
          "Mod+Shift+Delete".spawn-sh = "shutdown now";
          "Mod+R".switch-preset-column-width = { };
          "Mod+C".close-window = { };
          "Mod+M".quit = { };
          "Mod+Shift+Slash".show-hotkey-overlay = { };

          "Mod+Shift+C".center-column = { };

          "Mod+S".screenshot = { };

          "Mod+O".toggle-overview = { };

          "Mod+P".set-dynamic-cast-window = { };
          "Mod+Shift+P".set-dynamic-cast-monitor = { };
          "Mod+Ctrl+Shift+P".clear-dynamic-cast-target = { };

          "Mod+H".focus-column-left = { };
          "Mod+L".focus-column-right = { };
          "Mod+J".focus-window-or-workspace-down = { };
          "Mod+K".focus-window-or-workspace-up = { };

          "Mod+Shift+H".move-column-left = { };
          "Mod+Shift+L".move-column-right = { };
          "Mod+Shift+J".move-window-down-or-to-workspace-down = { };
          "Mod+Shift+K".move-window-up-or-to-workspace-up = { };

          "Mod+Shift+V".toggle-window-floating = { };
          "Mod+V".switch-focus-between-floating-and-tiling = { };

          "Mod+Shift+F".fullscreen-window = { };
        };
      };

    };

  };

}
