{ lib, config, ... }:
{
  options = {
    markdown-preview.enable = lib.mkEnableOption "Enable markdown-preview module";
  };
  config = lib.mkIf config.markdown-preview.enable {

    plugins.markdown-preview = {
      enable = true;
      lazyLoad.settings = {
        cmd = [ "MarkdownPreview" "MarkdownPreviewToggle" "MarkdownPreviewStop" ];
        ft = "markdown";
      };
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
