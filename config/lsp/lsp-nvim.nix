{ lib, config, ... }:
{
  options = {
    lsp-nvim.enable = lib.mkEnableOption "Enable lsp-nvim module";
  };
  config = lib.mkIf config.lsp-nvim.enable {
    plugins = {
      lsp-format = {
        enable = false; # Enable it if you want lsp-format integration for none-ls
      };
      lsp = {
        enable = true;
        capabilities = "offsetEncoding = 'utf-16'";
        servers = {
          clangd = {
            enable = true;
          };
          lua_ls = {
            enable = true;
            extraOptions = {
              settings = {
                Lua = {
                  completion = {
                    callSnippet = "Replace";
                  };
                  diagnostics = {
                    globals = [ "vim" ];
                  };

                  telemetry = {
                    enabled = false;
                  };
                  hint = {
                    enable = true;
                  };
                };
              };
            };
          };
          nil_ls = {
            enable = false;
          };
          nixd = {
            enable = true;
          };
          ts_ls = {
            enable = true;
            autostart = true;
            filetypes = [
              "javascript"
              "javascriptreact"
              "typescript"
              "typescriptreact"
            ];
            extraOptions = {
              settings = {
                javascript = {
                  inlayHints = {
                    includeInlayEnumMemberValueHints = true;
                    includeInlayFunctionLikeReturnTypeHints = true;
                    includeInlayFunctionParameterTypeHints = true;
                    includeInlayParameterNameHints = "all";
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true;
                    includeInlayPropertyDeclarationTypeHints = true;
                    includeInlayVariableTypeHints = true;
                    includeInlayVariableTypeHintsWhenTypeMatchesName = true;
                  };
                };
                typescript = {
                  inlayHints = {
                    includeInlayEnumMemberValueHints = true;
                    includeInlayFunctionLikeReturnTypeHints = true;
                    includeInlayFunctionParameterTypeHints = true;
                    includeInlayParameterNameHints = "all";
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true;
                    includeInlayPropertyDeclarationTypeHints = true;
                    includeInlayVariableTypeHints = true;
                    includeInlayVariableTypeHintsWhenTypeMatchesName = true;
                  };
                };
              };
            };
          };
          eslint = {
            enable = true;
          };
          pyright = {
            enable = true;
          };
          ruff = {
            enable = true;
          };

          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
            settings = {
              checkOnSave = true;
              check = {
                command = "clippy";
              };
              # inlayHints = {
              #   enable = true;
              #   showParameterNames = true;
              #   parameterHintsPrefix = "<- ";
              #   otherHintsPrefix = "=> ";
              # };
              procMacro = {
                enable = true;
              };
            };
          };
        };
        keymaps = {
          silent = true;
          lspBuf = {
            gd = {
              action = "definition";
              desc = "Goto Definition";
            };
            gr = {
              action = "references";
              desc = "Goto References";
            };
            gD = {
              action = "declaration";
              desc = "Goto Declaration";
            };
            gI = {
              action = "implementation";
              desc = "Goto Implementation";
            };
            gT = {
              action = "type_definition";
              desc = "Type Definition";
            };
            K = {
              action = "hover";
              desc = "Hover";
            };
            "<leader>cw" = {
              action = "workspace_symbol";
              desc = "Workspace Symbol";
            };
            "<leader>cr" = {
              action = "rename";
              desc = "Rename";
            };
            "<leader>ca" = {
              action = "code_action";
              desc = "Code Action";
            };
            "<C-k>" = {
              action = "signature_help";
              desc = "Signature Help";
            };
          };
          diagnostic = {
            "<leader>cd" = {
              action = "open_float";
              desc = "Line Diagnostics";
            };
            "[d" = {
              action = "goto_next";
              desc = "Next Diagnostic";
            };
            "]d" = {
              action = "goto_prev";
              desc = "Previous Diagnostic";
            };
          };
        };
        onAttach = ''
          vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(args)
              local client = vim.lsp.get_client_by_id(args.data.client_id)
              if client.server_capabilities.inlayHintProvider then
                vim.lsp.inlay_hint.enable(false)
              end
              vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
            end,
          })
        '';
      };
    };
    extraConfigLua = ''
          local _border = "rounded"

          require('lspconfig.ui.windows').default_options = {
            border = _border
          }

          vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
            vim.lsp.handlers.hover, {
              border = _border
            }
          )

          vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
            vim.lsp.handlers.signature_help, {
              border = _border
            }
          )

          vim.diagnostic.config({
      			float = { border = "rounded" },
      			virtual_text = {
      				prefix = "",
      			},
            signs = true,
            underline = true,
            update_in_insert = true,
      		})

        --   vim.api.nvim_create_autocmd("LspAttach", {
        --   group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        --   callback = function(args)
        --     local client = vim.lsp.get_client_by_id(args.data.client_id)
        --     if client.server_capabilities.inlayHintProvider then
        --       vim.lsp.inlay_hint.enable(false)
        --     end
        --     vim.bo[args.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        --
        --     local opts = { buffer = args.buf }
        --     vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        --     vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        --     vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        --     vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
        --     vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, opts)
        --     vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        --     vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        --     vim.keymap.set("n", "<space>cw", vim.lsp.buf.workspace_symbol, opts)
        --     vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, opts)
        --     vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
        --     vim.keymap.set("n", "<space>cf", function()
        --       vim.lsp.buf.format({ async = true })
        --     end, opts)
        --     vim.keymap.set("n", "<space>cd", vim.diagnostic.open_float, opts)
        --     vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
        --     vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
        --   end,
        -- })
    '';
  };
}
