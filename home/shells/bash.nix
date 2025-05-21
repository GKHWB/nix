{ osConfig, ... }:

{
	programs.bash = {
		enable = true;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch --flake /home/alter/nix/#${osConfig.networking.hostName}";
			vim = "nvim";
		};
	};
}
