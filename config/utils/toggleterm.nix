{
  plugins.toggleterm = {
    enable = true;
    settings = {
      size = ''
        function(term)
          if term.direction == "horizontal" then
            return 15
              elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end
      '';
      open_mapping = "[[<A-i>]]";
      hide_numbers = true;
      shade_terminals = true;
      start_in_insert = true;
      terminal_mappings = true;
      persist_mode = true;
      insert_mappings = true;
      close_on_exit = true;
      shell = "zsh";
      direction = "horizontal"; # 'vertical' | 'horizontal' | 'window' | 'float'
      auto_scroll = true;
      float_opts = {
        border = "single"; # 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        width = 80;
        height = 20;
        winblend = 0;
      };
      winbar = {
        enabled = true;
        name_formatter = ''
          function(term)
            return term.name
          end
        '';
      };
    };
  };

  # extraConfigLua = ''
  #   function _G.set_terminal_keymaps()
  #   	local opts = { buffer = 0 }
  #   	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  #   	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  #   	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  #   	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  #   	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  #   	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  #   	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
  #   end
  #
  #   -- if you only want these mappings for toggle term use term://*toggleterm#* instead
  #   -- vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
  # '';
}
