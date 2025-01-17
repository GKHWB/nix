{
	programs.bash = {
		enable = true;
		shellAliases = {
			rebuild = "sudo nixos-rebuild switch --flake /home/alter/nix/#amalgam && swww img -t grow /home/alter/nix/amalgam/wallpapersymlink";
			vim = "nvim";
		};
	};
}
