{
  lib,
  config,
  pkgs,
  ...
}:
{
  # TODO: Refactor this as neotest is supported on nixvim now
  options = {
    neotest.enable = lib.mkEnableOption "Enable neotest module";
  };
  config = lib.mkIf config.neotest.enable {
    plugins = {
      neotest = {
        enable = true;
        lazyLoad.settings = {
          cmd = "Neotest";
          keys = [
            {
              __unkeyed-1 = "<leader>tt";
              __unkeyed-2.__raw = "function() require('neotest').run.run(vim.fn.expand '%') end";
              desc = "Run File";
            }
            {
              __unkeyed-1 = "<leader>tT";
              __unkeyed-2.__raw = "function() require('neotest').run.run(vim.loop.cwd()) end";
              desc = "Run All Test Files";
            }
            {
              __unkeyed-1 = "<leader>tr";
              __unkeyed-2.__raw = "function() require('neotest').run.run() end";
              desc = "Run Nearest";
            }
            {
              __unkeyed-1 = "<leader>td";
              __unkeyed-2.__raw = ''
                function()
                  require('lz.n').trigger_load('nvim-dap')
                  require('neotest').run.run({ strategy = 'dap' })
                end
              '';
              desc = "Run Nearest with debugger";
            }
            {
              __unkeyed-1 = "<leader>ts";
              __unkeyed-2.__raw = "function() require('neotest').summary.toggle() end";
              desc = "Toggle Summary";
            }
            {
              __unkeyed-1 = "<leader>to";
              __unkeyed-2.__raw = "function() require('neotest').output.open{ enter = true, auto_close = true } end";
              desc = "Show Output";
            }
            {
              __unkeyed-1 = "<leader>tO";
              __unkeyed-2.__raw = "function() require('neotest').output_panel.toggle() end";
              desc = "Toggle Output Panel";
            }
            {
              __unkeyed-1 = "<leader>tS";
              __unkeyed-2.__raw = "function() require('neotest').run.stop() end";
              desc = "Stop";
            }
          ];
        };
        adapters = {
          java.enable = true;
          python.enable = true;
          vitest.enable = true;
          plenary.enable = true;
        };
        settings = {
          output = {
            enabled = true;
            open_on_run = true;
          };
          summary = {
            enabled = true;
          };
        };
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      FixCursorHold-nvim
      nvim-nio
    ];
  };
}
