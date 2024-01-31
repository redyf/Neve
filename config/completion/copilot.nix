{
  plugins.copilot-lua = {
    enable = true;
  };

  # keymaps = [
  #   {
  #     mode = "n";
  #     key = "<leader>t";
  #     action = "+copilot";
  #   }
  #
  #   {
  #     mode = "n";
  #     key = "<leader>to";
  #     action = "<cmd>:Copilot panel<cr>";
  #     options = {
  #       silent = true;
  #       desc = "Open Copilot";
  #     };
  #   }
  #
  #   {
  #     mode = "n";
  #     key = "<leader>tc";
  #     action = "<cmd>:lua require('copilot.suggestion').toggle_auto_trigger()<cr>";
  #     options = {
  #       silent = true;
  #       desc = "Toggle Copilot";
  #     };
  #   }
  # ];

  extraConfigLua = ''
      require('copilot').setup({
      panel = {
        enabled = false,
        auto_refresh = true,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>"
        },
        layout = {
          position = "bottom", -- | top | left | right
          ratio = 0.4
        },
      },
      suggestion = {
        enabled = false,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<M-l>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
      copilot_node_command = 'node', -- Node.js version must be > 18.x
      server_opts_overrides = {},
    })
  '';
}
