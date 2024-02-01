{ pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "neotest-java";
      version = "v0.9.0";
      src = pkgs.fetchFromGitHub {
        owner = "rcasia";
        repo = "neotest-java";
        rev = "2234bfa8044dc39a8baf90470747c65e4623a222";
        sha256 = "0w5fvqic3qapi9ggfb81nqa9fl6jv831s91r0wgn4d7c35h0340r";
      };
    })
    neotest
    FixCursorHold-nvim
    neotest-python
    neotest-plenary
  ];
  # extraConfigLua = ''
  #   require("neotest").setup({
  #     adapters = {
  #       require("neotest-python")({
  #         dap = {justMyCode = false},
  #         }),
  #         require("neotest-plenary"),
  #     require("neotest-vim-test")({
  #       ignore_file_types = { "python", "vim", "lua" },
  #     }),
  #     }
  #     })
  # '';
  extraConfigLua = ''
     require("neotest").setup({
      adapters = {
        require("neotest-java")({
          ignore_wrapper = false,
        }),
        -- require("neotest-python")({
        -- dap = { justMyCode = false },
        -- }),
        require "neotest-python",
      },
    })
  '';
  keymaps = [
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>lua require('neotest').run.run(vim.fn.expand '%')<CR>";
      options = {
        desc = "Run File";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>tT";
      action = "<cmd>lua require('neotest').run.run(vim.loop.cwd())<CR>";
      options = {
        desc = "Run All Test Files";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>tr";
      action = "<cmd>lua require('neotest').run.run()<CR>";
      options = {
        desc = "Run Nearest";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>td";
      action = "<cmd>lua require('neotest').run.run({strategy = dap'})<CR>";
      options = {
        desc = "Run Nearest";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>ts";
      action = "<cmd>lua require('neotest').summary.toggle()<CR>";
      options = {
        desc = "Toggle Summary";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>to";
      action = "<cmd>lua require('neotest').output.open{ enter = true, auto_close = true }<CR>";
      options = {
        desc = "Show Output";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>tO";
      action = "<cmd>lua require('neotest').output_panel.toggle()<CR>";
      options = {
        desc = "Toggle Output Panel";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>tS";
      action = "<cmd>lua require('neotest').run.stop()<CR>";
      options = {
        desc = "Stop";
        silent = true;
      };
    }
  ];
}
