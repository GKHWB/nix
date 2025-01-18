{
  # Nixvim config
  programs.nixvim = {
    enable = true;

    plugins.web-devicons.enable = true;

    plugins.telescope = {
      enable = true;
      extensions.file-browser.enable = true;
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
  };
}
