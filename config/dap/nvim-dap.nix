{ lib, config, ... }:
{
  options = {
    nvim-dap.enable = lib.mkEnableOption "Enable Debug Adapter Protocol module";
  };
  config = lib.mkIf config.nvim-dap.enable {
    plugins = {
      dap = {
        enable = true;
        # Wave 3: dap loads on first use. Keymaps with `require('dap')` live in
        # lazyLoad.settings.keys (raw callbacks); `<cmd>Dap*<CR>` keymaps and
        # manual `:Dap*` commands are covered by the cmd triggers below.
        lazyLoad.settings = {
          cmd = [
            "DapToggleBreakpoint"
            "DapContinue"
            "DapStepInto"
            "DapStepOut"
            "DapStepOver"
            "DapToggleRepl"
            "DapTerminate"
          ];
          keys = [
            {
              __unkeyed-1 = "<leader>dB";
              __unkeyed-2.__raw = "function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end";
              desc = "Breakpoint Condition";
            }
            {
              __unkeyed-1 = "<leader>da";
              __unkeyed-2.__raw = "function() require('dap').continue({ before = get_args }) end";
              desc = "Run with Args";
            }
            {
              __unkeyed-1 = "<leader>dC";
              __unkeyed-2.__raw = "function() require('dap').run_to_cursor() end";
              desc = "Run to cursor";
            }
            {
              __unkeyed-1 = "<leader>dg";
              __unkeyed-2.__raw = "function() require('dap').goto_() end";
              desc = "Go to line (no execute)";
            }
            {
              __unkeyed-1 = "<leader>dj";
              __unkeyed-2.__raw = "function() require('dap').down() end";
              desc = "Down";
            }
            {
              __unkeyed-1 = "<leader>dk";
              __unkeyed-2.__raw = "function() require('dap').up() end";
              desc = "Up";
            }
            {
              __unkeyed-1 = "<leader>dl";
              __unkeyed-2.__raw = "function() require('dap').run_last() end";
              desc = "Run Last";
            }
            {
              __unkeyed-1 = "<leader>dp";
              __unkeyed-2.__raw = "function() require('dap').pause() end";
              desc = "Pause";
            }
            {
              __unkeyed-1 = "<leader>ds";
              __unkeyed-2.__raw = "function() require('dap').session() end";
              desc = "Session";
            }
            {
              __unkeyed-1 = "<leader>dw";
              __unkeyed-2.__raw = "function() require('dap.ui.widgets').hover() end";
              desc = "Widgets";
            }
          ];
        };
        # dap-python's setup runs inside dap's config (extensionConfigLua) and
        # dap-ui/dap-virtual-text register listeners on dap — load them with dap.
        luaConfig.pre = ''
          require('lz.n').trigger_load('nvim-dap-python')
          require('lz.n').trigger_load('nvim-dap-ui')
          require('lz.n').trigger_load('nvim-dap-virtual-text')
        '';
        signs = {
          dapBreakpoint = {
            text = "●";
            texthl = "DapBreakpoint";
          };
          dapBreakpointCondition = {
            text = "●";
            texthl = "DapBreakpointCondition";
          };
          dapLogPoint = {
            text = "◆";
            texthl = "DapLogPoint";
          };
        };
        configurations = {
          java = [
            {
              type = "java";
              request = "launch";
              name = "Debug (Attach) - Remote";
              hostName = "127.0.0.1";
              port = 5005;
            }
          ];
        };
      };
      dap-virtual-text = {
        enable = true;
        # No trigger of its own: loaded via trigger_load from dap's luaConfig.pre.
        lazyLoad.settings.lazy = true;
      };
      dap-ui = {
        enable = true;
        lazyLoad.settings = {
          # Official nixvim docs pattern: ensure nvim-dap is loaded first.
          before.__raw = "function() require('lz.n').trigger_load('nvim-dap') end";
          keys = [
            {
              __unkeyed-1 = "<leader>du";
              __unkeyed-2.__raw = "function() require('dapui').toggle() end";
              desc = "Dap UI";
            }
            {
              __unkeyed-1 = "<leader>de";
              __unkeyed-2.__raw = "function() require('dapui').eval() end";
              mode = [
                "n"
                "v"
              ];
              desc = "Eval";
            }
          ];
        };
        settings = {
          floating.mappings = {
            close = [
              "<ESC>"
              "q"
            ];
          };
        };
      };
      dap-python = {
        enable = true;
        # Setup is injected into dap's config (extensionConfigLua); only needs
        # to be on the rtp when dap loads.
        lazyLoad.settings.lazy = true;
      };
    };
    # `<cmd>Dap*<CR>` keymaps: safe eager keymaps (rule 3 exception) — the
    # commands are lz.n cmd triggers on plugins.dap.
    keymaps = [
      {
        mode = "n";
        key = "<leader>db";
        action = ":DapToggleBreakpoint<cr>";
        options = {
          silent = true;
          desc = "Toggle Breakpoint";
        };
      }
      {
        mode = "n";
        key = "<leader>dc";
        action = ":DapContinue<cr>";
        options = {
          silent = true;
          desc = "Continue";
        };
      }
      {
        mode = "n";
        key = "<leader>di";
        action = ":DapStepInto<cr>";
        options = {
          silent = true;
          desc = "Step into";
        };
      }
      {
        mode = "n";
        key = "<leader>do";
        action = ":DapStepOut<cr>";
        options = {
          silent = true;
          desc = "Step Out";
        };
      }
      {
        mode = "n";
        key = "<leader>dO";
        action = ":DapStepOver<cr>";
        options = {
          silent = true;
          desc = "Step Over";
        };
      }
      {
        mode = "n";
        key = "<leader>dr";
        action = ":DapToggleRepl<cr>";
        options = {
          silent = true;
          desc = "Toggle REPL";
        };
      }
      {
        mode = "n";
        key = "<leader>dt";
        action = ":DapTerminate<cr>";
        options = {
          silent = true;
          desc = "Terminate";
        };
      }
    ];
  };
}
