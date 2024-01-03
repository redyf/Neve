{
  plugins.treesitter = {
    enable = true;
    nixvimInjections = true;
    ensureInstalled = [
      "help"
      "javascript"
      "typescript"
      "c"
      "lua"
      "rust"
      "jsx"
      "tsx"
      "nix"
      "bash"
      "json"
      "python"
    ];
  };
}
