{ lib, config, ... }:
{
  options = {
    notify.enable = lib.mkEnableOption "Enable notify module";
  };
  config = lib.mkIf config.notify.enable {
    plugins.notify = {
      enable = true;
      settings = {
        topDown = true;
        backgroundColour = "#000000";
        fps = 60;
        render = "default";
        timeout = 500;
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>un";
        action = ''
          <cmd>lua require("notify").dismiss({ silent = true, pending = true })<cr>
        '';
        options = {
          desc = "Dismiss All Notifications";
        };
      }
    ];
    extraConfigLua = ''
        local notify = require("notify")

       local function show_notification(message, level)
         notify(message, level, { title = "conform.nvim" })
       end

       function ToggleLineNumber()
         if vim.wo.number then
           vim.wo.number = false
           show_notification("Line numbers disabled", "info")
         else
           vim.wo.number = true
           vim.wo.relativenumber = false
           show_notification("Line numbers enabled", "info")
         end
       end

       function ToggleRelativeLineNumber()
         if vim.wo.relativenumber then
           vim.wo.relativenumber = false
           show_notification("Relative line numbers disabled", "info")
         else
           vim.wo.relativenumber = true
           vim.wo.number = false
           show_notification("Relative line numbers enabled", "info")
         end
       end

       function ToggleWrap()
         if vim.wo.wrap then
           vim.wo.wrap = false
           show_notification("Wrap disabled", "info")
         else
           vim.wo.wrap = true
           vim.wo.number = false
           show_notification("Wrap enabled", "info")
         end
       end

       function ToggleInlayHints()
         local is_enabled = vim.lsp.inlay_hint.is_enabled()
         vim.lsp.inlay_hint.enable(not is_enabled)
         if is_enabled then
           show_notification("Inlay Hints disabled", "info")
         else
           show_notification("Inlay Hints enabled", "info")
         end
       end

       vim.api.nvim_create_autocmd("BufReadPost", {
         callback = function()
           local current_dir = vim.fn.getcwd()
           local is_nixpkgs = current_dir:match("nixpkgs$")
           if is_nixpkgs then
             vim.b.disable_autoformat = true
             show_notification("Autoformat-on-save disabled for nixpkgs", "info")
           else
             vim.b.disable_autoformat = false
           end
         end,
       })

       vim.api.nvim_create_user_command("FormatToggle", function(args)
         local is_global = not args.bang
         local current_dir = vim.fn.getcwd()
         local is_nixpkgs = current_dir:match("nixpkgs$")

         if is_global then
           vim.g.disable_autoformat = not vim.g.disable_autoformat
           if vim.g.disable_autoformat then
             show_notification("Autoformat-on-save disabled globally", "info")
           else
             show_notification("Autoformat-on-save enabled globally", "info")
           end
         elseif is_nixpkgs then
           vim.b.disable_autoformat = not vim.b.disable_autoformat
           if vim.b.disable_autoformat then
             show_notification("Autoformat-on-save disabled for nixpkgs", "info")
           else
             show_notification("Autoformat-on-save enabled for nixpkgs", "info")
           end
         else
           vim.b.disable_autoformat = not vim.b.disable_autoformat
           if vim.b.disable_autoformat then
             show_notification("Autoformat-on-save disabled for this buffer", "info")
           else
             show_notification("Autoformat-on-save enabled for this buffer", "info")
           end
         end
       end, {
         desc = "Toggle autoformat-on-save",
         bang = true,
       })

      local filtered_message = { "No information available" }

      -- Override notify function to filter out messages
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.notify = function(message, level, opts)
        local merged_opts = vim.tbl_extend("force", {
          on_open = function(win)
            local buf = vim.api.nvim_win_get_buf(win)
            vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
          end,
        }, opts or {})

        for _, msg in ipairs(filtered_message) do
          if message == msg then
            return
          end
        end
        return notify(message, level, merged_opts)
      end
    '';
  };
}
