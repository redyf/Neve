{
  plugins.neogit = {
    enable = true;
    disableBuiltinNotifications = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>Neogit<CR>";
    }
  ];
}
