{ config, pkgs, ... }:
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
      settings = {
        sources = [
          { name = "nvim_lsp"; }
	  { name = "vsnip"; }
        ];
        snippet.expand = ''
          function(args)
	    vim.fn["vsnip#anonymous"](args.body)
	  end
        '';
	mapping = {
	  "<C-j>" = "cmp.mapping.select_next_item()";
	  "<C-k>" = "cmp.mapping.select_prev_item()";
	  "<C-Space>" = "cmp.mapping.complete()";
	};
      };
    };

    plugins.cmp-nvim-lsp = {
      enable = true;
    };

    plugins.cmp-vsnip = {
      enable = true;
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

    plugins.lazygit = {
      enable = true;
    };

    opts = {
       number = true;
       relativenumber = true;
    };

    plugins.twilight.enable = true;

    plugins.zen-mode.enable = true;

    extraPlugins = with pkgs.vimPlugins; [
    vim-pencil
    ];

    globals.mapleader = " ";
    keymaps = [
      {
        mode = "n";
        key = "<leader>f";
        action = ":Telescope file_browser<CR>";
      }
      {
        mode = "n";
	key = "<leader>t";
	action = ":NvimTreeToggle<CR>";
      }
      {
        mode = "n";
	key = "<leader>lg";
	action = ":LazyGit<CR>";
      }
      {
        mode = "n";
	key = "<leader>p";
	action = ":set spell | set norelativenumber | set nonumber | PencilSoft<CR>";
      }
      {
        mode = "n";
	key = "<leader>c";
	action = ":set nospell | set relativenumber | set number | PencilOff<CR>";
      }
      {
        mode = "n";
	key = "<leader>z";
	action = ":ZenMode<CR>";
      }
    ];
  };
}
