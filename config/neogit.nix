{
  plugins.neogit = {
    enable = true;
    disableBuiltinNotifications = true;
  };
  keymaps = [
    {
      key = "<leader>gg";
      action = "<cmd>Neogit<CR>";
    }
  ];
}
