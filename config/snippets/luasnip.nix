{
  pkgs,
  config,
  ...
}: {
  plugins.luasnip = {
    enable = true;
    extraConfig = {
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
}
