{ lib, config, ... }:
{
  options = {
    trouble.enable = lib.mkEnableOption "Enable trouble module";
  };
  config = lib.mkIf config.trouble.enable {
    plugins.trouble = {
      enable = true;
      settings = {
        auto_close = true;
      };
    };
    # TODO: Add keybinds to close trouble (q would be nice), rn I need to use :x to close it...
    keymaps = [
      {
        mode = "n";
        key = "<leader>x";
        action = "+diagnostics/quickfix";
      }
      {
        mode = "n";
        key = "<leader>xx";
        action = "<cmd>Trouble diagnostics toggle<cr>";
        options = {
          silent = true;
          desc = "Diagnostics (Trouble)";
        };
      }
      {
        mode = "n";
        key = "<leader>xX";
        action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
        options = {
          silent = true;
          desc = "Buffer Diagnostics (Trouble)";
        };
      }
      {
        mode = "n";
        key = "<leader>xt";
        action = "<cmd>Trouble todo<cr>";
        options = {
          silent = true;
          desc = "Todo (Trouble)";
        };
      }
      {
        mode = "n";
        key = "<leader>xQ";
        action = "<cmd>Trouble qflist toggle<cr>";
        options = {
          silent = true;
          desc = "Quickfix List (Trouble)";
        };
      }
    ];
  };
}
