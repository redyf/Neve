{ lib, config, ... }:
{
  options = {
    gitsigns.enable = lib.mkEnableOption "Enable gitsigns module";
  };
  config = lib.mkIf config.gitsigns.enable {
    plugins.gitsigns = {
      enable = true;
      settings = {
        trouble = true;
        current_line_blame = false;
      };
    };
    keymaps = [
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>gh";
        action = "gitsigns";
        options = {
          silent = true;
          desc = "+hunks";
        };
      }
      {
        mode = "n";
        key = "<leader>ghb";
        action = ":Gitsigns blame_line<CR>";
        options = {
          silent = true;
          desc = "Blame line";
        };
      }
      {
        mode = "n";
        key = "<leader>ghd";
        action = ":Gitsigns diffthis<CR>";
        options = {
          silent = true;
          desc = "Diff This";
        };
      }
      {
        mode = "n";
        key = "<leader>ghp";
        action = ":Gitsigns preview_hunk<CR>";
        options = {
          silent = true;
          desc = "Preview hunk";
        };
      }
      {
        mode = "n";
        key = "<leader>ghR";
        action = ":Gitsigns reset_buffer<CR>";
        options = {
          silent = true;
          desc = "Reset Buffer";
        };
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>ghr";
        action = ":Gitsigns reset_hunk<CR>";
        options = {
          silent = true;
          desc = "Reset Hunk";
        };
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>ghs";
        action = ":Gitsigns stage_hunk<CR>";
        options = {
          silent = true;
          desc = "Stage Hunk";
        };
      }
      {
        mode = "n";
        key = "<leader>ghS";
        action = ":Gitsigns stage_buffer<CR>";
        options = {
          silent = true;
          desc = "Stage Buffer";
        };
      }
      {
        mode = "n";
        key = "<leader>ghu";
        action = ":Gitsigns undo_stage_hunk<CR>";
        options = {
          silent = true;
          desc = "Undo Stage Hunk";
        };
      }
    ];
  };
}
