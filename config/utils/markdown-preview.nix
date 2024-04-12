{
  plugins.markdown-preview = {
    enable = true;
    settings = {
      browser = "floorp";
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
