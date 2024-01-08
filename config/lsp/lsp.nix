{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        clangd = {enable = true;};
        lua-ls = {enable = true;};
        nixd = {enable = true;};
        tsserver = {
          enable = true;
          filetypes = ["javascript" "javascriptreact" "typescript" "typescriptreact"];
        };
        eslint = {enable = true;};
        pyright = {enable = true;};
        ruff-lsp = {enable = true;};

        rust-analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
          settings = {
            procMacro = {
              enable = true;
            };
          };
        };
      };
      keymaps = {
        silent = true;
        lspBuf = {
          gd = "definition";
          K = "hover";
          gD = "declaration";
          gT = "type_definition";
          gi = "implementation";
          gr = "references";
          "<leader>vrn" = "rename";
          "<leader>vca" = "code_action";
          "<leader>vrr" = "references";
          "<leader>vws" = "workspace_symbol";
          "<C-h>" = "signature_help";
        };
        diagnostic = {
          "<leader>cd" = "open_float";
          "[d" = "goto_next";
          "]d" = "goto_prev";
        };
      };
    };
  };
}
