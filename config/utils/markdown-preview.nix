{
  plugins.markdown-preview = {
    enable = true;
    browser = "firefox";
    theme = "dark";
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
}
