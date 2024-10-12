{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    staline.enable = lib.mkEnableOption "Enable staline module";
  };
  config = lib.mkIf config.staline.enable {
    extraPlugins = with pkgs.vimUtils; [
      (buildVimPlugin {
        pname = "staline.nvim";
        version = "2024-02-05";
        src = pkgs.fetchFromGitHub {
          owner = "tamton-aquib";
          repo = "staline.nvim";
          rev = "a53f869278b8b186a5afd6f21680cd103c381599";
          hash = "sha256-GDMKzxFDtQk5LL+rMsxTGTyLv69w5NUd+u19noeO5ws=";
        };
      })
    ];
    extraConfigLua = ''
        require("staline").setup({
        sections = {
          left = { "-mode", " ", "branch" },
          mid = { "lsp_name" },
          right = { "file_name", "line_column" },
        },
        inactive_sections = {
          left = { "-mode", " ", "branch" },
          mid = { "lsp_name" },
          right = { "file_name", "line_column" },
        },
        defaults = {
          left_separator = " ",
          right_separator = "  ",
          branch_symbol = " ",
          mod_symbol = "",
          line_column = "[%l/%L]",
          inactive_color = "#80a6f2", --#303030 is the default
          inactive_bgcolor = "none",
        },
        special_table = {
          lazy = { "Plugins", "💤 " },
          TelescopePrompt = { "Telescope", "  " },
          oil = { "Oil", "󰏇 " },
          lazygit = { "LazyGit", " " },
        },
        mode_icons = {
          ["n"] = "NORMAL",
          ["no"] = "NORMAL",
          ["nov"] = "NORMAL",
          ["noV"] = "NORMAL",
          ["niI"] = "NORMAL",
          ["niR"] = "NORMAL",
          ["niV"] = "NORMAL",
          ["i"] = "INSERT",
          ["ic"] = "INSERT",
          ["ix"] = "INSERT",
          ["s"] = "INSERT",
          ["S"] = "INSERT",
          ["v"] = "VISUAL",
          ["V"] = "VISUAL",
          [""] = "VISUAL",
          ["r"] = "REPLACE",
          ["r?"] = "REPLACE",
          ["R"] = "REPLACE",
          ["c"] = "COMMAND",
          ["t"] = "TERMINAL",
        },
      })
    '';
  };
}
