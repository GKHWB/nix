{
  programs.nushell = {
    enable = true;
    shellAliases = {
      update = "sudo nix flake update --flake /home/alter/nix/";
      rebuild = "sudo nixos-rebuild switch --flake /home/alter/nix#cradle";
    };
  };
}
