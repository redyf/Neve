{ lib, config, ... }:
{
  options = {
    undotree.enable = lib.mkEnableOption "Enable undotree module";
  };
  config = lib.mkIf config.undotree.enable {
    plugins.undotree = {
      enable = true;
      settings = {
        autoOpenDiff = true;
        focusOnToggle = true;
      };
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
  };
}
