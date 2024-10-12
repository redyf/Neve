{ lib, config, ... }:
{
  options = {
    lualine.enable = lib.mkEnableOption "Enable lualine module";
  };
  config = lib.mkIf config.lualine.enable {
    plugins.lualine = {
      enable = true;
      settings = {
        alwaysDivideMiddle = true;
        globalstatus = true;
        ignoreFocus = [ "neo-tree" ];
        extensions = [ "fzf" ];
        theme = "auto";
        componentSeparators = {
          left = "|";
          right = "|";
        };
        sectionSeparators = {
          left = "█"; # 
          right = "█"; # 
        };
        sections = {
          lualine_a = [ "mode" ];
          lualine_b = [
            "branch"
            ""
            "diff"
            "diagnostics"
          ];
          lualine_c = [ "filename" ];
          lualine_x = [ "filetype" ];
          lualine_y = [ "progress" ];
          lualine_z = [ ''" " .. os.date("%R")'' ];
        };
      };
    };
    extraConfigLua = ''
        config = function()
      		local harpoon = require("harpoon.mark")

      		local function truncate_branch_name(branch)
      			if not branch or branch == "" then
      				return ""
      			end

      			-- Match the branch name to the specified format
      			local user, team, ticket_number = string.find(branch, "(%w+)%/(%w+)%-(%d+)%-")

      			-- If the branch name matches the format, display sko-{ticket_number}, otherwise display the full branch name
      			if ticket_number then
      				return user .. "/" .. team .. "-" .. ticket_number
      			else
      				return branch
      			end
      		end

       		local function harpoon_component()
       			local total_marks = harpoon.get_length()

       			if total_marks == 0 then
       				return ""
       			end

       			local current_mark = "—"

       			local mark_idx = harpoon.get_current_index()
       			if mark_idx ~= nil then
       				current_mark = tostring(mark_idx)
       			end

       			return string.format("󱡅 %s/%d", current_mark, total_marks)
       		end

       		local function get_lsp_client(_)
       			---@type any?{}
       			local client_names = {}
       			local msg = "No Active Lsp"
       			local clients = vim.lsp.get_clients({ bufnr = 0 })
       			if next(clients) == nil then
       				return msg
       			end
       			for _, client in ipairs(clients) do
       				table.insert(client_names, client.name)
       			end
       			return #client_names == 0 and msg or table.concat(client_names, " | ")
       		end
       		local function wordcount()
       			return tostring(vim.fn.wordcount().words) .. " words"
       		end
       		local function readingtime()
       			return tostring(math.ceil(vim.fn.wordcount().words / 200.0)) .. " min"
       		end
       		local function is_markdown()
       			return vim.bo.filetype == "markdown" or vim.bo.filetype == "asciidoc"
       		end
       		local function navic()
       			return require("nvim-navic").get_location()
       		end
       		local function navic_is_available()
       			return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
       		end
       		local cmd_mode = function()
       			return require("noice").api.status.mode.get()
       		end
       		local show_mode = function()
       			return package.loaded["noice"] and require("noice").api.status.mode.has() or ""
       		end
        end
    '';
  };
}
