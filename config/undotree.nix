{
  config,
  pkgs,
  host,
  user,
  ...
}: {
  plugins.undotree = {
    enable = true;
    autoOpenDiff = true;
    focusOnToggle = true;
  };
  keymaps = [
    {
      key = "<leader>ut";
      action = "<cmd>UndotreeToggle<CR>";
      options = {
        silent = true;
        desc = "Undotree";
      };
    }
  ];
}
