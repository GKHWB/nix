{
  programs.nushell = {
    enable = true;
    shellAliases = {
      update = "sudo nix flake update --flake /home/alter/nix/";
    };
  };
}
