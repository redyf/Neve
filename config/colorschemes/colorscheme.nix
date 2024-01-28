{
  colorschemes = {
    rose-pine = {
      enable = false;
      style = "main"; #  "main", "moon", "dawn" or raw lua code
      disableItalics = false;
      transparentFloat = true;
      transparentBackground = true;
    };
    catppuccin = {
      enable = true;
      background = {
        light = "macchiato";
        dark = "mocha";
      };
      flavour = "mocha"; # "latte", "mocha", "frappe", "macchiato" or raw lua code
      disableBold = false;
      disableItalic = false;
      disableUnderline = false;
      transparentBackground = true;
      integrations = {
        noice = true;
        notify = true;
        treesitter = true;
        which_key = true;
        cmp = true;
        gitsigns = true;
        harpoon = true;
        neotree = true;
        mini.enabled = true;
        indent_blankline.enabled = true;
        native_lsp.enabled = true;
        telescope.enabled = true;
      };
    };
  };
}
