{
  plugins.alpha = {
    enable = true;
    layout = [
      {
        type = "padding";
        val = 1;
      }
      {
        opts = {
          hl = "Identifier";
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
          "              git@github.com:Redyf          "
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
        #   "            git@github.com:Redyf           "
        # ];
      }
      {
        type = "padding";
        val = 2;
      }
      {
        type = "group";
        val = [
          {
            command = "<CMD>Telescope find_files<CR>";
            desc = "  Find File";
            shortcut = "f";
          }
          {
            command = ":ene <BAR> startinsert <CR>";
            desc = "  New File";
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
