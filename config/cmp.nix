{
  plugins = {
    nvim-cmp = {
      enable = true;
      snippet.expand = "luasnip";
      sources = [
        {name = "path";}
        {name = "nvim_lsp";}
        {name = "luasnip";}
        {
          name = "buffer";
          # Words from other open buffers can also be suggested.
          option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
        }
      ];
      mapping = {
        "<C-p>" = {
          modes = ["i" "c"];
          action = "cmp.mapping.select_prev_item()";
        };
        "<C-n>" = {
          modes = ["i" "c"];
          action = "cmp.mapping.select_next_item()";
        };
        "<ENTER>" = {
          modes = ["i" "c"];
          action = "cmp.mapping.confirm({ select = true })";
        };
        "<C-Space>" = {
          modes = ["i" "c"];
          action = "cmp.mapping.complete()";
        };
        "<C-f>" = {
          modes = ["i" "c"];
          action = "cmp.mapping.scroll_docs(4)";
        };
        "<C-b>" = {
          modes = ["i" "c"];
          action = "cmp.mapping.scroll_docs(-4)";
        };
      };
    };
    cmp-buffer = {
      enable = true;
    };
    cmp_luasnip = {
      enable = true;
    };
    cmp-nvim-lua = {
      enable = true;
    };
    cmp-nvim-lsp = {
      enable = true;
    };
    cmp-path = {
      enable = true;
    };
  };
}
