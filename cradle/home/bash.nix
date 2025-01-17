{
	programs.bash = {
		enable = true;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch --flake /home/alter/nix/#cradle && swww img -t grow /home/alter/nix/cradle/wallpapersymlink";
			vim = "nvim";
		};
	};
}
