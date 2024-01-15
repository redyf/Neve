{
  colorschemes = {
    rose-pine = {
      enable = false;
      style = "main"; #  "main", "moon", "dawn" or raw lua code
      disableItalics = true;
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
        mini.enabled = true;
        native_lsp.enabled = true;
      };
    };
  };
}
