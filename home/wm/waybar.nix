{
	programs.waybar = {
		enable = true;
		settings = {
			mainBar = {
				layer = "top";
				position = "top";
				modules-left = [ "niri/workspaces" ];
				modules-center = [ "hyprland/window" ];
				modules-right = [ "battery" "clock" "tray" ];
				spacing = 5;
			};
		};
	};
}
