{ lib, config, ... }:
{
  options = {
    bufferline = {
      enable = lib.mkEnableOption "Enable bufferline module";

      keymaps = {
        enable = lib.mkOption {
          type = lib.types.bool;
          default = true;
          description = "Enable default keymaps";
        };

        enableHL = lib.mkOption {
          type = lib.types.bool;
          default = true;
          description = "Enable keymaps for switching buffers with h and l";
        };

        enableTab = lib.mkOption {
          type = lib.types.bool;
          default = true;
          description = "Enable keymaps for switching buffers with Tab and S-Tab";
        };
      };
    };
  };
  config =
    let
      cfg = config.bufferline;
    in
    lib.mkIf cfg.enable {
      plugins = {
        bufferline = {
          enable = true;
          settings = {
            options = {
              separatorStyle = "thick"; # “slant”, “padded_slant”, “slope”, “padded_slope”, “thick”, “thin“
              offsets = [
                {
                  filetype = "neo-tree";
                  text = "Neo-tree";
                  highlight = "Directory";
                  text_align = "left";
                }
              ];
            };
          };
        };
      };
      keymaps = lib.mkIf cfg.keymaps.enable (
        [
          {
            mode = "n";
            key = "<leader>bd";
            action = "<cmd>bdelete<cr>";
            options = {
              desc = "Delete buffer";
            };
          }

          {
            mode = "n";
            key = "<leader>bb";
            action = "<cmd>e #<cr>";
            options = {
              desc = "Switch to Other Buffer";
            };
          }

          # {
          #   mode = "n";
          #   key = "<leader>`";
          #   action = "<cmd>e #<cr>";
          #   options = {
          #     desc = "Switch to Other Buffer";
          #   };
          # }

          {
            mode = "n";
            key = "<leader>br";
            action = "<cmd>BufferLineCloseRight<cr>";
            options = {
              desc = "Delete buffers to the right";
            };
          }

          {
            mode = "n";
            key = "<leader>bl";
            action = "<cmd>BufferLineCloseLeft<cr>";
            options = {
              desc = "Delete buffers to the left";
            };
          }

          {
            mode = "n";
            key = "<leader>bo";
            action = "<cmd>BufferLineCloseOthers<cr>";
            options = {
              desc = "Delete other buffers";
            };
          }

          {
            mode = "n";
            key = "<leader>bp";
            action = "<cmd>BufferLineTogglePin<cr>";
            options = {
              desc = "Toggle pin";
            };
          }

          {
            mode = "n";
            key = "<leader>bP";
            action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
            options = {
              desc = "Delete non-pinned buffers";
            };
          }
        ]
        ++ (lib.optionals cfg.keymaps.enableTab [
          {
            mode = "n";
            key = "<Tab>";
            action = "<cmd>BufferLineCycleNext<cr>";
            options = {
              desc = "Cycle to next buffer";
            };
          }

          {
            mode = "n";
            key = "<S-Tab>";
            action = "<cmd>BufferLineCyclePrev<cr>";
            options = {
              desc = "Cycle to previous buffer";
            };
          }
        ])
        ++ (lib.optionals cfg.keymaps.enableHL [
          {
            mode = "n";
            key = "<S-l>";
            action = "<cmd>BufferLineCycleNext<cr>";
            options = {
              desc = "Cycle to next buffer";
            };
          }

          {
            mode = "n";
            key = "<S-h>";
            action = "<cmd>BufferLineCyclePrev<cr>";
            options = {
              desc = "Cycle to previous buffer";
            };
          }
        ])
      );
    };
}
