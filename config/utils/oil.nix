{
  plugins.oil = {
    enable = true;
    useDefaultKeymaps = true;
    float = {
      border = "rounded"; # 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
      winOptions = {
        winblend = 10;
      };
    };
    preview = {
      border = "rounded";
    };
    keymaps = {
      "g?" = "actions.show_help";
      "<CR>" = "actions.select";
      "<C-\\>" = "actions.select_vsplit";
      "<C-enter>" = "actions.select_split"; # this is used to navigate left
      "<C-t>" = "actions.select_tab";
      "<C-p>" = "actions.preview";
      "<C-c>" = "actions.close";
      "<C-r>" = "actions.refresh";
      "-" = "actions.parent";
      "_" = "actions.open_cwd";
      "`" = "actions.cd";
      "~" = "actions.tcd";
      "gs" = "actions.change_sort";
      "gx" = "actions.open_external";
      "g." = "actions.toggle_hidden";
    };
  };
  keymaps =
    [
      {
        mode = "n";
        key = "<leader>e";
        action = ":Oil<CR>";
        options = {
          desc = "Open parent directory";
          silent = true;
        };
      }
    ];
}
