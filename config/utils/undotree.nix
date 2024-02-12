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
      mode = "n";
      key = "<leader>ut";
      action = "<cmd>UndotreeToggle<CR>";
      options = {
        silent = true;
        desc = "Undotree";
      };
    }
  ];
}
