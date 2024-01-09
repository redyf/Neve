{
  plugins.gitsigns = {
    enable = true;
    trouble = true;
  };
  keymaps = [
    {
      mode = "v";
      key = "<leader>gh";
      action = "gitsigns";
      options = {
        silent = true;
        desc = "+gitsigns";
      };
    }
    {
      mode = "n";
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
      action = "gitsigns";
      options = {
        silent = true;
        desc = "Blame line";
      };
    }
    {
      mode = "n";
      key = "<leader>ghd";
      action = "Gitsigns diffthis";
      options = {
        silent = true;
        desc = "Diff This";
      };
    }
    {
      mode = "n";
      key = "<leader>ghp";
      action = "Gitsigns preview_hunk";
      options = {
        silent = true;
        desc = "Preview hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>ghR";
      action = "Gitsigns reset_buffer";
      options = {
        silent = true;
        desc = "Reset Buffer";
      };
    }
    {
      mode = [ "n" "v" ];
      key = "<leader>ghr";
      action = "Gitsigns reset_hunk";
      options = {
        silent = true;
        desc = "Reset Hunk";
      };
    }
    {
      mode = [ "n" "v" ];
      key = "<leader>ghs";
      action = "Gitsigns stage_hunk";
      options = {
        silent = true;
        desc = "Stage Hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>ghS";
      action = "Gitsigns stage_buffer";
      options = {
        silent = true;
        desc = "Stage Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>ghu";
      action = "Gitsigns undo_stage_hunk";
      options = {
        silent = true;
        desc = "Undo Stage Hunk";
      };
    }
  ];
}
