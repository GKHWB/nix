{ osConfig, ...}:

{
	programs.waybar = {
		enable = true;
		settings = if osConfig.networking.hostName == "amalgam" then
		{
			mainBar = {
				layer = "top";
				position = "top";
				modules-left = [ "niri/workspaces" ];
				modules-right = [ "battery" "clock" "tray" ];
				spacing = 5;
			};
		}
		else
		{
			mainBar = {
				layer = "top";
				position = "top";
				modules-left = [ "niri/workspaces" ];
				modules-right = [ "clock" "tray" ];
				spacing = 5;
			};
		};
	};
}
