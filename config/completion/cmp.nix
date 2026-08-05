{ lib, config, ... }:
{
  options = {
    cmp.enable = lib.mkEnableOption "Enable cmp module";
  };
  config = lib.mkIf config.cmp.enable {
    plugins = {
      cmp-nvim-lsp = {
        enable = true;
        lazyLoad.settings.event = "InsertEnter";
      }; # lsp
      cmp-buffer = {
        enable = true;
        lazyLoad.settings.event = "InsertEnter";
      };
      cmp-path = {
        enable = true;
        lazyLoad.settings.event = "InsertEnter";
      }; # file system paths
      cmp-cmdline = {
        enable = true;
        lazyLoad.settings.event = "CmdlineEnter";
      }; # autocomplete for cmdline
      cmp_luasnip = {
        enable = true;
        lazyLoad.settings.event = "InsertEnter";
      }; # snippets
      cmp = {
        enable = true;
        autoEnableSources = false;
        lazyLoad.settings = {
          event = [ "InsertEnter" "CmdlineEnter" ];
          before.__raw = "function() require('lz.n').trigger_load('luasnip') end";
        };
        luaConfig.pre = ''
          local luasnip = require("luasnip")
        '';
        luaConfig.post = ''
          local cmp = require("cmp")
          cmp.setup.cmdline({ "/", "?" }, {
            sources = {
              { name = "buffer" },
            },
          })
          cmp.setup.cmdline(":", {
            sources = cmp.config.sources({
              { name = "path" },
            }, {
              { name = "cmdline" },
            }),
          })
        '';
        settings = {
          experimental = {
            ghost_text = true;
          };
          mapping = {
            "<C-j>" = "cmp.mapping.select_next_item()";
            "<C-k>" = "cmp.mapping.select_prev_item()";

            "<Tab>" = ''
              cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                  luasnip.expand_or_jump()
                else
                  fallback()
                end
              end, { "i", "s" })
            '';

            "<S-Tab>" = ''
              cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif luasnip.locally_jumpable(-1) then
                  luasnip.jump(-1)
                else
                  fallback()
                end
              end, { "i", "s" })
            '';

            "<C-e>" = "cmp.mapping.abort()";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-b>" = "cmp.mapping.scroll_docs(-4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<CR>" = "cmp.mapping.confirm({ select = false })"; # Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })";
          };
          sources = [
            {
              name = "nvim_lsp";
            }
            {
              name = "buffer";
              keyword_length = 5;
            }
            {
              name = "path";
              keyword_length = 3;
            }
            {
              name = "luasnip";
              keyword_length = 3;
            }
          ];

          # Enable pictogram icons for lsp/autocompletion
          formatting = {
            fields = [
              "kind"
              "abbr"
              "menu"
            ];
            expandable_indicator = true;
          };
          performance = {
            debounce = 60;
            fetching_timeout = 200;
            max_view_entries = 30;
          };
          window = {
            completion = {
              border = "rounded";
              winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
            };
            documentation = {
              border = "rounded";
            };
          };
        };
      };
    };
  };
}
