{
  programs.fish = {
    enable = true;
    functions = {
      vim = "nvim $argv";
      mv = "command mv -i $argv";
      rebuild = "sudo nixos-rebuild switch --flake /home/alter/nix/#cradle && swww img -t grow /home/alter/nix/cradle/wallpapersymlink"; 
      tm = "tmux attach";
    };
  };
}
