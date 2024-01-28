{
  plugins = {
    nvim-cmp = {
      enable = true;
      autoEnableSources = true;
      performance = {
        debounce = 60;
        fetchingTimeout = 200;
        maxViewEntries = 30;
      };
      snippet = {
        expand = "luasnip";
      };
      formatting = {
        fields = [ "kind" "abbr" "menu" ];
        format = ''
          function(entry, vim_item)
              vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
              vim_item.menu = ({
                  path = "[Path]",
                  nvim_lua = "[NVIM_LUA]",
                  nvim_lsp = "[LSP]",
                  luasnip = "[Snippet]",
                  buffer = "[Buffer]",
              })[entry.source.name]
              return vim_item
          end
        '';
      };
      sources = [
        {
          name = "nvim_lsp";
          keywordLength = 1;
        }
        {
          name = "luasnip";
          keywordLength = 1;
        }
        {
          name = "buffer";
          # Words from other open buffers can also be suggested.
          option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          keywordLength = 3;
        }
        {
          name = "path";
          keywordLength = 3;
        }
      ];

      window = {
        completion = {
          border = "rounded";
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
        };
        documentation = {
          border = "rounded";
        };
      };

      mapping = {
        "<Tab>" = {
          modes = [ "i" "s" ];
          action = ''
             function(fallback)
             	if cmp.visible() then
            		cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
            	luasnip.expand_or_jump()
            else
            fallback()
                 end
            end
          '';
        };
        "<S-Tab>" = {
          modes = [ "i" "s" ];
          action = ''
                 function(fallback)
            	if cmp.visible() then
            		cmp.select_prev_item()
            	elseif luasnip.jumpable(-1) then
            		luasnip.jump(-1)
            	else
            		fallback()
            	end
            end
          '';
        };
        "<C-n>" = {
          action = "cmp.mapping.select_next_item()";
        };
        "<C-p>" = {
          action = "cmp.mapping.select_prev_item()";
        };
        "<C-e>" = {
          action = "cmp.mapping.abort()";
        };
        "<C-b>" = {
          action = "cmp.mapping.scroll_docs(-4)";
        };
        "<C-f>" = {
          action = "cmp.mapping.scroll_docs(4)";
        };
        "<C-Space>" = {
          action = "cmp.mapping.complete()";
        };
        "<CR>" = {
          action = "cmp.mapping.confirm({ select = true })";
        };
        "<S-CR>" = {
          action = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
        };
      };
    };
    cmp-buffer = {
      enable = true;
    };
    cmp_luasnip = {
      enable = true;
    };
    cmp-nvim-lsp = {
      enable = true;
    };
    cmp-path = {
      enable = true;
    };
  };
  extraConfigLua = ''
          luasnip = require("luasnip")
          kind_icons = {
            Text = "󰊄",
            Method = "",
            Function = "󰡱",
            Constructor = "",
            Field = "",
            Variable = "󱀍",
            Class = "",
            Interface = "",
            Module = "󰕳",
            Property = "",
            Unit = "",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = "",
          } 

           local cmp = require'cmp'

       -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
       cmp.setup.cmdline({'/', "?" }, {
         sources = {
           { name = 'buffer' }
         }
       })

      -- Set configuration for specific filetype.
       cmp.setup.filetype('gitcommit', {
         sources = cmp.config.sources({
           { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
         }, {
           { name = 'buffer' },
         })
       })

       -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
       cmp.setup.cmdline(':', {
         sources = cmp.config.sources({
           { name = 'path' }
         }, {
           { name = 'cmdline' }
         }),
         formatting = {
          format = function(_, vim_item)
            vim_item.kind = cmdIcons[vim_item.kind] or "FOO"
          return vim_item
         end
    }
       })  '';
}
