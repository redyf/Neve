{
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
}
