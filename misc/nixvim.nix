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
      };
    };

    opts = {
       number = true;
    };
  };
}
