{
  plugins.conform-nvim = {
    enable = true;
    formatOnSave = {
      lspFallback = true;
      timeoutMs = 500;
    };
    notifyOnError = true;
    formattersByFt = {
      lua = ["stylua"];
      python = ["black"];
      nix = ["alejandra"];
      html = ["prettier_d"];
      css = ["prettier_d"];
      javascript = ["prettierd"];
      javascriptreact = ["prettierd"];
      typescript = ["prettierd"];
      typescriptreact = ["prettierd"];
      markdown = ["prettierd"];
      rust = ["rustfmt prettier_d"];
    };
  };
}
