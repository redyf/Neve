{ lib, config, ... }:
{
  options = {
    luasnip.enable = lib.mkEnableOption "Enable luasnip module";
  };
  config = lib.mkIf config.luasnip.enable {
    plugins.friendly-snippets.enable = true;
    plugins.luasnip = {
      enable = true;
      lazyLoad.settings.event = "InsertEnter";
      settings = {
        enable_autosnippets = true;
        store_selection_keys = "<Tab>";
      };
    };
  };
}
