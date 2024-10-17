{ lib, config, ... }:
{
  options = {
    lspsaga.enable = lib.mkEnableOption "Enable lspsaga module";
  };
  config = lib.mkIf config.lspsaga.enable {
    plugins.lspsaga = {
      enable = true;
      beacon = {
        enable = true;
      };
      ui = {
        border = "rounded"; # One of none, single, double, rounded, solid, shadow
        codeAction = "💡"; # Can be any symbol you want 💡
      };
      hover = {
        openCmd = "!floorp"; # Choose your browser
        openLink = "gx";
      };
      diagnostic = {
        borderFollow = true;
        diagnosticOnlyCurrent = false;
        showCodeAction = true;
      };
      symbolInWinbar = {
        enable = true; # Breadcrumbs
      };
      codeAction = {
        extendGitSigns = false;
        showServerName = true;
        onlyInCursor = true;
        numShortcut = true;
        keys = {
          exec = "<CR>";
          quit = [
            "<Esc>"
            "q"
          ];
        };
      };
      lightbulb = {
        enable = false;
        sign = false;
        virtualText = true;
      };
      implement = {
        enable = false;
      };
      rename = {
        autoSave = false;
        keys = {
          exec = "<CR>";
          quit = [
            "<C-k>"
            "<Esc>"
          ];
          select = "x";
        };
      };
      outline = {
        autoClose = true;
        autoPreview = true;
        closeAfterJump = true;
        layout = "normal"; # normal or float
        winPosition = "right"; # left or right
        keys = {
          jump = "e";
          quit = "q";
          toggleOrJump = "o";
        };
      };
      scrollPreview = {
        scrollDown = "<C-f>";
        scrollUp = "<C-b>";
      };
    };
    # keymaps = [
    #   {
    #     mode = "n";
    #     key = "gd";
    #     action = "<cmd>Lspsaga finder def<CR>";
    #     options = {
    #       desc = "Goto Definition";
    #       silent = true;
    #     };
    #   }
    #   {
    #     mode = "n";
    #     key = "gr";
    #     action = "<cmd>Lspsaga finder ref<CR>";
    #     options = {
    #       desc = "Goto References";
    #       silent = true;
    #     };
    #   }
    #
    #   # {
    #   #   mode = "n";
    #   #   key = "gD";
    #   #   action = "<cmd>Lspsaga show_line_diagnostics<CR>";
    #   #   options = {
    #   #     desc = "Goto Declaration";
    #   #     silent = true;
    #   #   };
    #   # }
    #
    #   {
    #     mode = "n";
    #     key = "gI";
    #     action = "<cmd>Lspsaga finder imp<CR>";
    #     options = {
    #       desc = "Goto Implementation";
    #       silent = true;
    #     };
    #   }
    #
    #   {
    #     mode = "n";
    #     key = "gT";
    #     action = "<cmd>Lspsaga peek_type_definition<CR>";
    #     options = {
    #       desc = "Type Definition";
    #       silent = true;
    #     };
    #   }
    #
    #   {
    #     mode = "n";
    #     key = "K";
    #     action = "<cmd>Lspsaga hover_doc<CR>";
    #     options = {
    #       desc = "Hover";
    #       silent = true;
    #     };
    #   }
    #
    #   {
    #     mode = "n";
    #     key = "<leader>cw";
    #     action = "<cmd>Lspsaga outline<CR>";
    #     options = {
    #       desc = "Outline";
    #       silent = true;
    #     };
    #   }
    #
    #   {
    #     mode = "n";
    #     key = "<leader>cr";
    #     action = "<cmd>Lspsaga rename<CR>";
    #     options = {
    #       desc = "Rename";
    #       silent = true;
    #     };
    #   }
    #
    #   {
    #     mode = "n";
    #     key = "<leader>ca";
    #     action = "<cmd>Lspsaga code_action<CR>";
    #     options = {
    #       desc = "Code Action";
    #       silent = true;
    #     };
    #   }
    #
    #   {
    #     mode = "n";
    #     key = "<leader>cd";
    #     action = "<cmd>Lspsaga show_line_diagnostics<CR>";
    #     options = {
    #       desc = "Line Diagnostics";
    #       silent = true;
    #     };
    #   }
    #
    #   {
    #     mode = "n";
    #     key = "[d";
    #     action = "<cmd>Lspsaga diagnostic_jump_next<CR>";
    #     options = {
    #       desc = "Next Diagnostic";
    #       silent = true;
    #     };
    #   }
    #
    #   {
    #     mode = "n";
    #     key = "]d";
    #     action = "<cmd>Lspsaga diagnostic_jump_prev<CR>";
    #     options = {
    #       desc = "Previous Diagnostic";
    #       silent = true;
    #     };
    #   }
    # ];
  };
}
