{
  plugins.none-ls = {
    enable = false;
    enableLspFormat = false;
    updateInInsert = false;
    onAttach = ''
      function(client, bufnr)
          if client.supports_method "textDocument/formatting" then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format { bufnr = bufnr }
              end,
            })
          end
        end
    '';
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
        nixpkgs_fmt = {
          enable = true;
        };
        prettier = {
          enable = true;
          withArgs = ''
            {
              extra_args = { "--no-semi", "--single-quote" },
            }
          '';
        };
        rustfmt = {
          enable = true;
        };
        stylua = {
          enable = true;
        };
        black = {
          enable = true;
          withArgs = ''
            {
              extra_args = { "--fast" },
            }
          '';
        };
        jq = {
          enable = true;
        };
      };
    };
  };
  keymaps = [
    {
      mode = [ "n" "v" ];
      key = "<leader>cf";
      action = "<cmd>lua vim.lsp.buf.format()<cr>";
      options = {
        silent = true;
        desc = "Format";
      };
    }
  ];
}
