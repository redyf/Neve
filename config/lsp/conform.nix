{
  plugins.conform-nvim = {
    enable = true;
    formatOnSave = {
      lspFallback = true;
      timeoutMs = 500;
    };
    notifyOnError = true;
    formattersByFt = {
      html = [ [ "prettierd" "prettier" ] ];
      css = [ [ "prettierd" "prettier" ] ];
      javascript = [ [ "prettierd" "prettier" ] ];
      javascriptreact = [ [ "prettierd" "prettier" ] ];
      typescript = [ [ "prettierd" "prettier" ] ];
      typescriptreact = [ [ "prettierd" "prettier" ] ];
      java = [ "google-java-format" ];
      python = [ "black" ];
      lua = [ "stylua" ];
      nix = [ "nixpkgs_fmt" ];
      markdown = [ [ "prettierd" "prettier" ] ];
      rust = [ "rustfmt" ];
    };
  };

  # keymaps = [
  # {
  #   mode = ["n" "v"];
  #   key = "<leader>cf";
  #   action = "<cmd>lua require('conform').format()<cr>";
  #   options = {
  #     silent = true;
  #     desc = "Format";
  #   };
  # }
  # ];
}
