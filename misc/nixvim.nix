{
  # Nixvim config
  programs.nixvim = {
    enable = true;

    plugins.web-devicons.enable = true;

    plugins.telescope = {
      enable = true;
      extensions.file-browser.enable = true;
    };

    plugins.nvim-tree = {
      enable = true;
    };

    plugins.cmp = {
      enable = true;
      settings.sources = [
        { name = "nvim_lsp"; }
      ];
    };

    plugins.lsp = {
      enable = true;

      servers = {
        nixd.enable = true;

	rust_analyzer = {
	  enable = true;
	  installCargo = false;
	  installRustc = false;
	};
      };
    };

    opts = {
       number = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<S-F>";
        action = ":Telescope file_browser<CR>";
      }
    ];
  };

}
