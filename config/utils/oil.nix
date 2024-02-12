{
  plugins.oil = {
    enable = true;
    useDefaultKeymaps = true;
    deleteToTrash = true;
    viewOptions = {
      showHidden = true;
    };
    float = {
      padding = 2;
      maxWidth = 0; # ''math.ceil(vim.o.lines * 0.8 - 4)'';
      maxHeight = 0; # ''math.ceil(vim.o.columns * 0.8)'';
      border = "rounded"; # 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
      winOptions = {
        winblend = 0;
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
      "q" = "actions.close";
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>o";
      action = ":Oil --float<CR>";
      options = {
        desc = "Open parent directory";
        silent = true;
      };
    }
  ];
}
