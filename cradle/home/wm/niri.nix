{ config, ... }: {
  programs.niri = {
    settings = {
      prefer-no-csd = true;
      input.focus-follows-mouse.enable = true;
      input.warp-mouse-to-focus = true;
      hotkey-overlay.skip-at-startup = true;
      layout = {
        gaps = 16;
	default-column-width = {};
      };
      spawn-at-startup =
      [
      {
        command =
        [
        "waybar"
        ];
      }
      {
        command =
	[
	"swww-daemon"
	];
      }
      {
        command =
	[
	"xwayland-satellite"
	];
      }
      ];
      environment = {
        DISPLAY = ":0";
      };
      binds = with config.lib.niri.actions; {
        "Mod+Q".action.spawn = "kitty";
        "Mod+R".action.spawn = [ "wofi" "--show" "drun" ];
        "Mod+C".action = close-window;
        "Mod+M".action = quit;
        "Mod+Shift+Slash".action = show-hotkey-overlay;
      };
    };
  };
}
