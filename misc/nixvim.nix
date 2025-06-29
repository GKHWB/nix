{ config, pkgs, ... }:
{
  # Nixvim config
  programs.nixvim = {
    enable = true;

    dependencies.imagemagick.enable = true;

    autoCmd =
    [
    {
      command = "setlocal nonumber | setlocal norelativenumber | startinsert";
      event = [
      "TermOpen"
      ];
    }
    {
      command = "set softtabstop=2 | set shiftwidth=2 | set noexpandtab";
      event = [
      "BufEnter"
      "BufWinEnter"
      ];
      pattern = [
      "*.c"
      "*.h"
      ];
    }
    {
      command = "set softtabstop=2 | set shiftwidth=2 | set expandtab";
      event = [
      "BufEnter"
      "BufWinEnter"
      ];
      pattern = [
      "*.nix"
      ];
    }
    {
      command = "set softtabstop=4 | set shiftwidth=4 | set expandtab";
      event = [
      "BufEnter"
      "BufWinEnter"
      ];
      pattern = [
      "*.rs"
      ];
    }
    {
      command = "set softtabstop=4 | set shiftwidth=4 | set noexpandtab | set spell | PencilSoft";
      event = [
      "BufEnter"
      "BufWinEnter"
      ];
      pattern = [
      "*.txt"
      ];
    }
    ];

    diagnostic.settings = {
      virtual_text = true;
    };

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

    plugins.image.enable = true;

    plugins.lsp = {
      enable = true;

      servers = {
        nixd.enable = true;

	ccls = {
	  enable = true;
	};

	rust_analyzer = {
	  enable = true;
	  installCargo = true; 
	  installRustc = true; 
	};
      };
    };

    plugins.lazygit = {
      enable = true;
    };

    plugins.render-markdown.enable = true;

    opts = {
       number = true;
       relativenumber = true;
    };

    plugins.twilight.enable = true;

    plugins.zen-mode.enable = true;

    extraPlugins = with pkgs.vimPlugins; [
    vim-pencil
    wiki-vim
    ];

    extraConfigLua = "require(\"image\").setup({\n
      backend = \"kitty\",\n
      processor = \"magick_cli\", -- or \"magick_rock\"\n
      integrations = {\n
        markdown = {\n
          enabled = true,\n
          clear_in_insert_mode = false,\n
          download_remote_images = true,\n
          only_render_image_at_cursor = false,\n
          only_render_image_at_cursor_mode = \"popup\",\n
          floating_windows = false, -- if true, images will be rendered in floating markdown windows\n
          filetypes = { \"markdown\", \"vimwiki\" }, -- markdown extensions (ie. quarto) can go here\n
        },\n
        neorg = {\n
          enabled = true,\n
          filetypes = { \"norg\" },\n
        },\n
        html = {\n
          enabled = false,\n
        },\n
        css = {\n
          enabled = false,\n
        },\n
      },\n
      max_width = nil,\n
      max_height = nil,\n
      max_width_window_percentage = nil,\n
      max_height_window_percentage = 50,\n
      window_overlap_clear_enabled = false, -- toggles images when windows are overlapped\n
      window_overlap_clear_ft_ignore = { \"cmp_menu\", \"cmp_docs\", \"snacks_notif\", \"scrollview\", \"scrollview_sign\" },\n
      editor_only_render_when_focused = false, -- auto show/hide images when the editor gains/looses focus\n
      tmux_show_only_in_active_window = false, -- auto show/hide images in the correct Tmux window (needs visual-activity off)\n
      hijack_file_patterns = { \"*.png\", \"*.jpg\", \"*.jpeg\", \"*.gif\", \"*.webp\", \"*.avif\" }, -- render image files as images when opened\n
    })";

    globals.mapleader = " ";
    keymaps = [
      {
        mode = "n";
        key = "<leader>f";
        action = ":Telescope file_browser<CR>";
      }
      {
        mode = "n";
	key = "<leader>b";
	action = ":Telescope buffers<CR>";
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
	action = ":set spell | PencilSoft<CR>";
      }
      {
        mode = "n";
	key = "<leader>c";
	action = ":set nospell | PencilOff<CR>";
      }
      {
        mode = "n";
	key = "<leader>z";
	action = ":ZenMode<CR>";
      }
      {
        mode = "n";
	key = "<leader>ot";
	action = ":vsplit +term\\ fish<CR>";
      }
      {
        mode = "n";
	key = "<leader>h";
	action = ":noh<CR>";
      }
    ];
  };
}
