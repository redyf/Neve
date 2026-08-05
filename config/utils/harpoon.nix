{ lib, config, ... }:
{
  options = {
    harpoon.enable = lib.mkEnableOption "Enable harpoon module";
  };
  config = lib.mkIf config.harpoon.enable {
    plugins.harpoon = {
      enable = true;
      lazyLoad.settings.keys = [
        { __unkeyed-1 = "<leader>ha"; __unkeyed-2.__raw = "function() require'harpoon':list():add() end"; }
        { __unkeyed-1 = "<C-e>"; __unkeyed-2.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end"; }
        { __unkeyed-1 = "<C-j>"; __unkeyed-2.__raw = "function() require'harpoon':list():select(1) end"; }
        { __unkeyed-1 = "<C-k>"; __unkeyed-2.__raw = "function() require'harpoon':list():select(2) end"; }
        { __unkeyed-1 = "<C-l>"; __unkeyed-2.__raw = "function() require'harpoon':list():select(3) end"; }
        { __unkeyed-1 = "<C-m>"; __unkeyed-2.__raw = "function() require'harpoon':list():select(4) end"; }
      ];
    };
  };
}
