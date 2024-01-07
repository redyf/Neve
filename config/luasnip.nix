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
  # keymaps = [
  #   {
  #     mode = "i";
  #     key = "<tab>";
  #     action = ''
  #       ":lua require('luasnip').jumpable(1) and '<Plug>luasnip-jump-next' or '<tab>'"
  #     '';
  #     options = {
  #       silent = true;
  #     };
  #   }
  #   {
  #     mode = "s";
  #     key = "<tab>";
  #     action = "<cmd>lua require('luasnip').jump(1)<cr>";
  #     options = {
  #       silent = true;
  #     };
  #   }
  #   {
  #     mode = ["i" "s"];
  #     key = "<s-tab>";
  #     action = "<cmd>lua require('luasnip').jump(-1)<cr>";
  #     options = {
  #       silent = true;
  #     };
  #   }
  # ];
}
