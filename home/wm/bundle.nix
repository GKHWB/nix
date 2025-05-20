{ config, ...}: {
	imports = [
		./niri.nix
		./hyprlock.nix
		./waybar.nix
		./yazi.nix
	];
}
