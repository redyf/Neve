{
  plugins.trouble = {
    enable = true;
    autoClose = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>x";
      action = "diagnostics/quickfix";
    }
    {
      mode = "n";
      key = "<leader>xx";
      action = "<cmd>TroubleToggle<cr>";
      options = {
        silent = true;
        desc = "toggle trouble";
      };
    }
  ];
}
