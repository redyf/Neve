{
  plugins.neo-tree = {
    enable = true;
    closeIfLastWindow = true;
    window = {
      width = 30;
      autoExpandWidth = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = ":Neotree<CR>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<leader>be";
      action = ":Neotree buffers<CR>";
      options.silent = true;
    }
  ];
}
