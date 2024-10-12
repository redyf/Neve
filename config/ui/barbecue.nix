{ lib, config, ... }:
{
  options = {
    barbecue.enable = lib.mkEnableOption "Enable barbecue module";
  };
  config = lib.mkIf config.barbecue.enable {
    plugins.barbecue = {
      enable = true;
      settings = {
        create_autocmd = false;
        theme = "auto";
      };
    };
    extraConfigLua = ''
      vim.api.nvim_create_autocmd({
        "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
        "BufWinEnter",
        "CursorHold",
        "InsertLeave",

        -- include this if you have set `show_modified` to `true`
        "BufModifiedSet",
      }, {
        group = vim.api.nvim_create_augroup("barbecue.updater", {}),
        callback = function()
          require("barbecue.ui").update()
        end,
      })
    '';
  };
}
