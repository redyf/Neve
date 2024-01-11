{
  plugins.alpha = {
    enable = true;
    layout = [
      {
        type = "padding";
        val = 4;
      }
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
      {
        type = "padding";
        val = 2;
      }
      {
        opts = {
          hl = "AlphaButtons";
          position = "center";
          spacing = 1;
        };
        type = "group";
        val = [
          {
            command = "<CMD>Telescope find_files<CR>";
            desc = "  Find file";
            shortcut = "f";
          }

          {
            command = ":ene <BAR> startinsert <CR>";
            desc = "  New file";
            shortcut = "n";
          }

          {
            command = ":Telescope oldfiles <CR>";
            desc = "  Recent files";
            shortcut = "r";
          }

          {
            command = ":Telescope live_grep <CR>";
            desc = "  Find text";
            shortcut = "g";
          }

          {
            command = ":lua require('persistence').load()<cr>";
            desc = "  Restore Session";
            shortcut = "s";
          }

          {
            command = ":qa<CR>";
            desc = "  Quit Neovim";
            shortcut = "q";
          }
        ];
      }
    ];
  };
}
