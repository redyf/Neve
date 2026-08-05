{ lib, config, ... }:
{
  options = {
    undotree.enable = lib.mkEnableOption "Enable undotree module";
  };
  config = lib.mkIf config.undotree.enable {
    plugins.undotree = {
      enable = true;
      lazyLoad.settings.cmd = [
        "UndotreeToggle"
        "UndotreeShow"
        "UndotreeFocus"
        "UndotreeHide"
      ];
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
