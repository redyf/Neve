{
  plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader><space>" = {
        action = "find_files, {}";
        desc = "Find project files";
      };
      "<leader>ff" = {
        action = "find_files, {}";
        desc = "Find project files";
      };
      "<leader>/" = {
        action = "live_grep";
        desc = "Grep (root dir)";
      };
      "<leader>fr" = {
        action = "oldfiles, {}";
        desc = "Recent";
      };
      "<leader>fb" = {
        action = "buffers, {}";
        desc = "Buffers";
      };
      "<leader>b" = {
        action = "buffers, {}";
        desc = "+buffer";
      };
      "<C-p>" = {
        action = "git_files, {}";
        desc = "Search git files";
      };
      "<leader>gc" = {
        action = "git_commits, {}";
        desc = "commits";
      };
      "<leader>gs" = {
        action = "git_status, {}";
        desc = "status";
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>st";
      action = "<cmd>TodoTelescope<cr>";
      options = {
        silent = true;
        desc = "Todo (Telescope)";
      };
    }
    {
      mode = "n";
      key = "<leader>,";
      action = "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>";
      options = {
        desc = "Switch Buffer";
      };
    }
  ];
}
