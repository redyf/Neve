{
  plugins.neogit = {
    enable = false;
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
