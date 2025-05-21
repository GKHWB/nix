{ osConfig, ... }:

{
  programs.fish = {
    enable = true;
    functions = {
      vim = "nvim $argv";
      mv = "command mv -i $argv";
      rebuild = "sudo nixos-rebuild switch --flake /home/alter/nix/#${osConfig.networking.hostName}"; 
      update = "sudo nix flake update --flake /home/alter/nix/";
      tm = "tmux attach";
    };
  };
}
