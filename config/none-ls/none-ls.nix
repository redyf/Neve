{
  plugins.none-ls = {
    enable = true;
    enableLspFormat = false;
    updateInInsert = false;
    sources = {
      code_actions = {
        eslint_d.enable = true;
        gitsigns.enable = true;
        statix.enable = true;
      };
      diagnostics = {
        statix = {
          enable = true;
        };
        luacheck = {
          enable = true;
        };
        flake8 = {
          enable = true;
        };
        eslint_d = {
          enable = true;
        };
      };
      formatting = {
        alejandra = {
          enable = true;
        };
        prettier_d_slim = {
          enable = true;
        };
        rustfmt = {
          enable = true;
        };
        stylua = {
          enable = true;
        };
        black = {
          enable = true;
        };
        jq = {
          enable = true;
        };
      };
    };
  };
  keymaps = [
    {
      mode = ["n" "v"];
      key = "<leader>cf";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        silent = true;
        desc = "Format";
      };
    }
  ];
}
