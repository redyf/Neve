{
  plugins.neogit = {
    enable = false;
    disableBuiltinNotifications = true;
  };
  keymaps = [
    {
      key = "<leader>gs";
      action = "<cmd>Neogit<CR>";
    }
  ];
}
