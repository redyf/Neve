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
      html = ["prettierd"];
      css = ["prettierd"];
      javascript = ["prettierd"];
      javascriptreact = ["prettierd"];
      typescript = ["prettierd"];
      typescriptreact = ["prettierd"];
      markdown = ["prettierd"];
      rust = ["rustfmt"];
    };
  };
}
