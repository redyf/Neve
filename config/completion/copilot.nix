{
  plugins.copilot-lua =
    {
      enable = true;
      panel = {
        enabled = false;
        autoRefresh = true;
        keymap = {
          jumpPrev = "[[";
          jumpNext = "]]";
          accept = "<CR>";
          refresh = "gr";
          open = "<M-CR>";
        };
        layout = {
          position = "bottom"; # | top | left | right
          ratio = 0.4;
        };
      };
      suggestion = {
        enabled = false;
        autoTrigger = true;
        debounce = 75;
        keymap = {
          accept = "<M-l>";
          acceptWord = false;
          acceptLine = false;
          next = "<M-]>";
          prev = "<M-[>";
          dismiss = "<C-]>";
        };
      };
      filetypes = {
        yaml = false;
        markdown = false;
        help = false;
        gitcommit = false;
        gitrebase = false;
        hgcommit = false;
        svn = false;
        cvs = false;
        "." = false;
      };
      copilotNodeCommand = "node"; # Node.js version must be > 18.x
      serverOptsOverrides = { };
    };
}

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

