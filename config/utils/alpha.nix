{
  plugins.alpha =
    {
      enable = true;
      theme = null;
      iconsEnabled = true;
      layout =
        let
          padding = val: {
            type = "padding";
            inherit val;
          };
        in
        [
          (padding 4)
          {
            opts = {
              hl = "AlphaHeader";
              position = "center";
            };
            type = "text";
            val = [
              "    ██▀███  ▓█████ ▓█████▄▓██   ██▓  █████▒ "
              "   ▓██ ▒ ██▒▓█   ▀ ▒██▀ ██▌▒██  ██▒▓██   ▒  "
              "   ▓██ ░▄█ ▒▒███   ░██   █▌ ▒██ ██░▒████ ░  "
              "   ▒██▀▀█▄  ▒▓█  ▄ ░▓█▄   ▌ ░ ▐██▓░░▓█▒  ░  "
              "   ░██▓ ▒██▒░▒████▒░▒████▓  ░ ██▒▓░░▒█░     "
              "   ░ ▒▓ ░▒▓░░░ ▒░ ░ ▒▒▓  ▒   ██▒▒▒  ▒ ░     "
              "     ░▒ ░ ▒░ ░ ░  ░ ░ ▒  ▒ ▓██ ░▒░  ░       "
              "     ░░   ░    ░    ░ ░  ░ ▒ ▒ ░░   ░ ░     "
              "      ░        ░  ░   ░    ░ ░              "
              "                                            "
              "              git@github.com:redyf          "
            ];
            # val = [
            #   "          ▗▄▄▄       ▗▄▄▄▄    ▄▄▄▖         "
            #   "          ▜███▙       ▜███▙  ▟███▛         "
            #   "           ▜███▙       ▜███▙▟███▛          "
            #   "            ▜███▙       ▜██████▛           "
            #   "     ▟█████████████████▙ ▜████▛     ▟▙     "
            #   "    ▟███████████████████▙ ▜███▙    ▟██▙    "
            #   "           ▄▄▄▄▖           ▜███▙  ▟███▛    "
            #   "          ▟███▛             ▜██▛ ▟███▛     "
            #   "         ▟███▛               ▜▛ ▟███▛      "
            #   "▟███████████▛                  ▟██████████▙"
            #   "▜██████████▛                  ▟███████████▛"
            #   "      ▟███▛ ▟▙               ▟███▛         "
            #   "     ▟███▛ ▟██▙             ▟███▛          "
            #   "    ▟███▛  ▜███▙           ▝▀▀▀▀           "
            #   "    ▜██▛    ▜███▙ ▜██████████████████▛     "
            #   "     ▜▛     ▟████▙ ▜████████████████▛      "
            #   "           ▟██████▙       ▜███▙            "
            #   "          ▟███▛▜███▙       ▜███▙           "
            #   "         ▟███▛  ▜███▙       ▜███▙          "
            #   "         ▝▀▀▀    ▀▀▀▀▘       ▀▀▀▘          "
            #   "                                           "
            #   "            git@github.com:redyf           "
            # ];
          }
          (padding 2)
          {
            type = "button";
            val = "  Find file";
            on_press.raw = "require('telescope.builtin').find_files";
            opts = {
              keymap = [ "n" "f" ":Telescope find_files <CR>" { noremap = true; silent = true; nowait = true; } ];
              shortcut = "f";

              position = "center";
              cursor = 3;
              width = 45;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          (padding 1)
          {
            type = "button";
            val = "  New file";
            on_press.__raw = "function() vim.cmd[[ene]] end";
            opts = {
              keymap = [ "n" "n" ":ene <BAR> startinsert <CR>" { noremap = true; silent = true; nowait = true; } ];
              shortcut = "n";

              position = "center";
              cursor = 3;
              width = 45;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          (padding 1)
          {
            type = "button";
            val = "  Recent files";
            on_press.raw = "require('telescope.builtin').oldfiles";
            opts = {
              keymap = [ "n" "r" ":Telescope oldfiles <CR>" { noremap = true; silent = true; nowait = true; } ];
              shortcut = "r";

              position = "center";
              cursor = 3;
              width = 45;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          (padding 1)
          {
            type = "button";
            val = "  Find text";
            on_press.raw = "require('telescope.builtin').live_grep";
            opts = {
              keymap = [ "n" "g" ":Telescope live_grep <CR>" { noremap = true; silent = true; nowait = true; } ];
              shortcut = "g";

              position = "center";
              cursor = 3;
              width = 45;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          (padding 1)
          {
            type = "button";
            val = "  Restore Session";
            on_press.raw = "require('persistence').load()";
            opts = {
              keymap = [ "n" "s" ":lua require('persistence').load()<cr>" { noremap = true; silent = true; nowait = true; } ];
              shortcut = "s";

              position = "center";
              cursor = 3;
              width = 45;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
          (padding 1)
          {
            type = "button";
            val = "  Quit Neovim";
            on_press.__raw = "function() vim.cmd[[qa]] end";
            opts = {
              keymap = [ "n" "q" ":qa<CR>" { noremap = true; silent = true; nowait = true; } ];
              shortcut = "q";

              position = "center";
              cursor = 3;
              width = 45;
              align_shortcut = "right";
              hl_shortcut = "Keyword";
            };
          }
        ];
    };
}
