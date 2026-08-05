{ lib, config, ... }:
{
  options = {
    treesitter-nvim.enable = lib.mkEnableOption "Enable treesitter-nvim module";
  };
  config = lib.mkIf config.treesitter-nvim.enable {
    plugins.treesitter = {
      enable = true;
      settings = {
        highlight = {
          enable = true;
        };
        indent = {
          enable = true;
        };
        ensure_installed = [
          "bash"
          "c"
          "html"
          "css"
          "javascript"
          "jsdoc"
          "json"
          "lua"
          "luadoc"
          "luap"
          "nix"
          "rust"
          "java"
          "markdown"
          "markdown_inline"
          "python"
          "query"
          "regex"
          "tsx"
          "typescript"
          "vim"
          "vimdoc"
          "toml"
          "yaml"
        ];
        auto_install = false;
        incremental_selection = {
          enable = true;
          keymaps = {
            init_selection = "<C-space>";
            node_incremental = "<C-space>";
            scope_incremental = false;
            node_decremental = "<bs>";
          };
        };
      };
      nixvimInjections = true;
    };

    plugins.treesitter-textobjects = {
      enable = true;
      settings = {
        select = {
          enable = true;
          lookahead = true;
          keymaps = {
            "aa" = "@parameter.outer";
            "ia" = "@parameter.inner";
            "af" = "@function.outer";
            "if" = "@function.inner";
            "ac" = "@class.outer";
            "ic" = "@class.inner";
            "ii" = "@conditional.inner";
            "ai" = "@conditional.outer";
            "il" = "@loop.inner";
            "al" = "@loop.outer";
            "at" = "@comment.outer";
          };
        };
        move = {
          enable = true;
          goto_next_start = {
            "]m" = "@function.outer";
            "]]" = "@class.outer";
          };
          goto_next_end = {
            "]M" = "@function.outer";
            "][" = "@class.outer";
          };
          goto_previous_start = {
            "[m" = "@function.outer";
            "[[" = "@class.outer";
          };
          goto_previous_end = {
            "[M" = "@function.outer";
            "[]" = "@class.outer";
          };
        };
        swap = {
          enable = true;
          swap_next = {
            "<leader>a" = "@parameters.inner";
          };
          swap_previous = {
            "<leader>A" = "@parameter.outer";
          };
        };
      };
    };

    plugins.ts-autotag = {
      enable = true;
      # Loads on the first FileType event; the plugin attaches per-buffer via
      # its own Filetype autocmd and no-ops for unsupported filetypes.
      lazyLoad.settings.event = "FileType";
    };

    plugins.treesitter-context = {
      enable = true;
      # Attaches to already-loaded buffers during setup, so BufReadPost is
      # enough to cover the first buffer too.
      lazyLoad.settings.event = "BufReadPost";
    };

    plugins.ts-context-commentstring = {
      enable = true;
      disableAutoInitialization = false;
    };
  };
}
