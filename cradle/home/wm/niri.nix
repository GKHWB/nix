{ config, ... }: {
  programs.niri = {
    settings = {
      prefer-no-csd = true;
      input.warp-mouse-to-focus = false;
      hotkey-overlay.skip-at-startup = true;
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
      cursor = {
        hide-after-inactive-ms = 5000;
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
      window-rules =
      [
      {
        matches = [{ app-id = "^FreeTube$"; }];
	default-column-width = { proportion = 1.; };
      }
      {
        matches = [{ app-id = "^vesktop$"; }];
	default-column-width = { proportion = 1.; };
      }
      {
        matches = [{ app-id = "^zen-twilight$"; }];
	default-column-width = { proportion = 2. / 3.; };
      }
      {
        matches = [{ app-id = "^Godot$"; }];
	default-column-width = { proportion = 1.; };
      }
      ];
      binds = with config.lib.niri.actions; {
        "Mod+Q".action.spawn = ["kitty" "-e" "tmux" "attach"];
        "Mod+D".action.spawn = [ "wofi" "--show" "drun" ];
	"Mod+B".action.spawn = "zen";
	"Mod+E".action.spawn = [ "kitty" "-e" "yazi" ];
	"Mod+F".action.spawn = "freetube";
	"Mod+Ctrl+L".action.spawn = "hyprlock";
	"Mod+Shift+Delete".action.spawn = [ "shutdown" "now" ];
	"Mod+R".action = switch-preset-column-width;
        "Mod+C".action = close-window;
        "Mod+M".action = quit;
        "Mod+Shift+Slash".action = show-hotkey-overlay;

	"Mod+S".action = screenshot;

        "Mod+H".action = focus-column-left;
	"Mod+L".action = focus-column-right;
	"Mod+J".action = focus-window-or-workspace-down;
	"Mod+K".action = focus-window-or-workspace-up;

	"Mod+Shift+H".action = move-column-left;
	"Mod+Shift+L".action = move-column-right;
	"Mod+Shift+J".action = move-window-down-or-to-workspace-down;
	"Mod+Shift+K".action = move-window-up-or-to-workspace-up;

	"Mod+Alt+H".action = focus-monitor-left;
	"Mod+Alt+L".action = focus-monitor-right;

	"Mod+Shift+Alt+H".action = move-column-to-monitor-left;
	"Mod+Shift+Alt+L".action = move-column-to-monitor-right;

	"Mod+BracketLeft".action = consume-or-expel-window-left;
	"Mod+BracketRight".action = consume-or-expel-window-right;

	"Mod+Shift+V".action = toggle-window-floating;
	"Mod+V".action = switch-focus-between-floating-and-tiling;
      };
    };
  };
}
