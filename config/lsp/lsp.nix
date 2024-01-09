{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        clangd = { enable = true; };
        lua-ls = { enable = true; };
        nixd = { enable = true; };
        tsserver = {
          enable = true;
          filetypes = [ "javascript" "javascriptreact" "typescript" "typescriptreact" ];
        };
        eslint = { enable = true; };
        pyright = { enable = true; };
        ruff-lsp = { enable = true; };

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
          gr = "references";
          gD = "declaration";
          gI = "implementation";
          gT = "type_definition";
          K = "hover";
          "<leader>cws" = "workspace_symbol";
          "<leader>cr" = "rename";
          "<leader>ca" = "code_action";
          "<C-k>" = "signature_help";
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
