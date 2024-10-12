{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    luasnip.enable = lib.mkEnableOption "Enable luasnip module";
  };
  config = lib.mkIf config.luasnip.enable {
    plugins.luasnip = {
      enable = true;
      settings = {
        enable_autosnippets = true;
        store_selection_keys = "<Tab>";
      };
      fromVscode = [
        {
          lazyLoad = true;
          paths = "${pkgs.vimPlugins.friendly-snippets}";
        }
      ];
    };
  };
}
