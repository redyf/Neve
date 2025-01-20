{ lib, config, ... }:
{
  options = {
    fidget.enable = lib.mkEnableOption "Enable fidget module";
  };
  config = lib.mkIf config.fidget.enable {
    plugins.fidget = {
      enable = true;
      settings = {
        logger = {
          level = "warn"; # “off”, “error”, “warn”, “info”, “debug”, “trace”
          float_precision = 1.0e-2; # Limit the number of decimals displayed for floats
        };
        progress = {
          poll_rate = 0; # How and when to poll for progress messages
          suppress_on_insert = true; # Suppress new messages while in insert mode
          ignore_done_already = false; # Ignore new tasks that are already complete
          ignore_empty_message = false; # Ignore new tasks that don't contain a message
          clear_on_detach =
            # Clear notification group when LSP server detaches
            lib.nixvim.mkRaw ''
              function(client_id)
                local client = vim.lsp.get_client_by_id(client_id)
                return client and client.name or nil
              end
            '';
          notification_group =
            # How to get a progress message's notification group key
            lib.nixvim.mkRaw ''
              function(msg) return msg.lsp_client.name end
            '';
          ignore = [ ]; # List of LSP servers to ignore
          lsp = {
            progress_ringbuf_size = 0; # Configure the nvim's LSP progress ring buffer size
          };
          display = {
            render_limit = 16; # How many LSP messages to show at once
            done_ttl = 3; # How long a message should persist after completion
            done_icon = "✔"; # Icon shown when all LSP progress tasks are complete
            done_style = "Constant"; # Highlight group for completed LSP tasks
            progress_ttl = lib.nixvim.mkRaw "math.huge"; # How long a message should persist when in progress
            progress_icon = {
              pattern = "dots";
              period = 1;
            }; # Icon shown when LSP progress tasks are in progress
            progress_style = "WarningMsg"; # Highlight group for in-progress LSP tasks
            group_style = "Title"; # Highlight group for group name (LSP server name)
            icon_style = "Question"; # Highlight group for group icons
            priority = 30; # Ordering priority for LSP notification group
            skip_history = true; # Whether progress notifications should be omitted from history
            format_message = lib.nixvim.mkRaw ''
              require ("fidget.progress.display").default_format_message
            ''; # How to format a progress message
            format_annote = lib.nixvim.mkRaw ''
              function (msg) return msg.title end
            ''; # How to format a progress annotation
            format_group_name = lib.nixvim.mkRaw ''
              function (group) return tostring (group) end
            ''; # How to format a progress notification group's name
            overrides = {
              rust_analyzer = {
                name = "rust-analyzer";
              };
            }; # Override options from the default notification config
          };
        };
        notification = {
          poll_rate = 10; # How frequently to update and render notifications
          filter = "info"; # “off”, “error”, “warn”, “info”, “debug”, “trace”
          history_size = 128; # Number of removed messages to retain in history
          override_vim_notify = true;
          redirect = lib.nixvim.mkRaw ''
            function(msg, level, opts)
              if opts and opts.on_open then
                return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
              end
            end
          '';
          configs = {
            default = lib.nixvim.mkRaw "require('fidget.notification').default_config";
          };

          window = {
            normal_hl = "Comment";
            winblend = 0;
            border = "none"; # none, single, double, rounded, solid, shadow
            zindex = 45;
            max_width = 0;
            max_height = 0;
            x_padding = 1;
            y_padding = 0;
            align = "bottom";
            relative = "editor";
          };
          view = {
            stack_upwards = true; # Display notification items from bottom to top
            icon_separator = " "; # Separator between group name and icon
            group_separator = "---"; # Separator between notification groups
            group_separator_hl =
              # Highlight group used for group separator
              "Comment";
          };
        };
      };
    };
  };
}
