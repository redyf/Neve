{pkgs, ...}: {
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
        defaults = {
        left_separator = " ",
        right_separator = "  ",
        branch_symbol = " ",
        mod_symbol = "",
        line_column = "[%l/%L]",
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
      special_table = {
        lazy = { "Plugins", "💤 " },
        TelescopePrompt = { "Telescope", "  " },
      },
      sections = {
        left = { "-mode", " ", "branch" },
        mid = { "lsp_name" },
        right = { "file_name", "line_column" },
      },
    })
  '';
}
