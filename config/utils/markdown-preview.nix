{ lib, config, ... }:
{
  # TODO: Switch to peek.nvim
  options = {
    markdown-preview.enable = lib.mkEnableOption "Enable markdown-preview module";
  };
  config = lib.mkIf config.markdown-preview.enable {

    plugins.markdown-preview = {
      enable = true;
      settings = {
        browser = "firefox";
        theme = "dark";
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>cp";
        action = "<cmd>MarkdownPreview<cr>";
        options = {
          desc = "Markdown Preview";
        };
      }
    ];
  };
}
