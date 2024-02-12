{
  plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native = {
        enable = true;
      };
      project-nvim = {
        enable = true;
      };
      ui-select = {
        settings = {
          specific_opts = {
            codeactions = true;
          };
        };
      };
      undo = {
        enable = true;
        mappings = {
          i = {
            "<cr>" = "yank_additions";
            "<s-cr>" = "yank_deletions";
            "<c-cr>" = "restore";
          };
          n = {
            "y" = "yank_additions";
            "Y" = "yank_deletions";
            "u" = "restore";
          };
        };
      };
    };
    # If you'd prefer Telescope not to enter a normal-like mode when hitting escape (and instead exiting), you can map <Esc> to do so via:
    defaults = {
      mappings = {
        i = {
          "<esc>" = {
            __raw = ''
              function(...)
                return require("telescope.actions").close(...)
              end'';
          };
        };
      };
    };
    keymaps = {
      "<leader><space>" = {
        action = "find_files, {}";
        desc = "Find project files";
      };
      "<leader>/" = {
        action = "live_grep";
        desc = "Grep (root dir)";
      };
      "<leader>:" = {
        action = "command_history, {}";
        desc = "Command History";
      };
      "<leader>b" = {
        action = "buffers, {}";
        desc = "+buffer";
      };
      "<leader>ff" = {
        action = "find_files, {}";
        desc = "Find project files";
      };
      "<leader>fr" = {
        action = "oldfiles, {}";
        desc = "Recent";
      };
      "<leader>fb" = {
        action = "buffers, {}";
        desc = "Buffers";
      };
      "<C-p>" = {
        action = "git_files, {}";
        desc = "Search git files";
      };
      "<leader>gc" = {
        action = "git_commits, {}";
        desc = "Commits";
      };
      "<leader>gs" = {
        action = "git_status, {}";
        desc = "Status";
      };
      "<leader>sa" = {
        action = "autocommands, {}";
        desc = "Auto Commands";
      };
      "<leader>sb" = {
        action = "current_buffer_fuzzy_find, {}";
        desc = "Buffer";
      };
      "<leader>sc" = {
        action = "command_history, {}";
        desc = "Command History";
      };
      "<leader>sC" = {
        action = "commands, {}";
        desc = "Commands";
      };
      "<leader>sD" = {
        action = "diagnostics, {}";
        desc = "Workspace diagnostics";
      };
      "<leader>sh" = {
        action = "help_tags, {}";
        desc = "Help pages";
      };
      "<leader>sH" = {
        action = "highlights, {}";
        desc = "Search Highlight Groups";
      };
      "<leader>sk" = {
        action = "keymaps, {}";
        desc = "Keymaps";
      };
      "<leader>sM" = {
        action = "man_pages, {}";
        desc = "Man pages";
      };
      "<leader>sm" = {
        action = "marks, {}";
        desc = "Jump to Mark";
      };
      "<leader>so" = {
        action = "vim_options, {}";
        desc = "Options";
      };
      "<leader>sR" = {
        action = "resume, {}";
        desc = "Resume";
      };
      "<leader>uC" = {
        action = "colorscheme, {}";
        desc = "Colorscheme preview";
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>fp";
      action = "<cmd>Telescope projects<CR>";
      options = {
        desc = "Projects";
      };
    }

    {
      mode = "n";
      key = "<leader>sd";
      action = "<cmd>Telescope diagnostics bufnr=0<cr>";
      options = {
        desc = "Document diagnostics";
      };
    }

    {
      mode = "n";
      key = "<leader>st";
      action = "<cmd>TodoTelescope<cr>";
      options = {
        silent = true;
        desc = "Todo (Telescope)";
      };
    }

    # {
    #   mode = "n";
    #   key = "<leader>,";
    #   action = "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>";
    #   options = {
    #     desc = "Switch Buffer";
    #   };
    # }
  ];
  extraConfigLua = ''
    local telescope = require('telescope')
    telescope.setup{
        pickers = {
          colorscheme = {
            enable_preview = true
          }
        }
    }
  '';
}
