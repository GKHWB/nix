{ config, ... }: {
  programs.niri = {
    settings = {
      prefer-no-csd = true;
      hotkey-overlay.skip-at-startup = true;
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
