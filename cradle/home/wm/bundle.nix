{ config, ...}: {
	imports = [
		./niri.nix
		./waybar.nix
		./yazi.nix
	];
}
