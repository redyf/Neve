{self, ...}: {
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
    ./colorscheme.nix
    ./presence.nix
    ./keymaps.nix
    ./whichkey.nix
    ./telescope.nix
    ./treesitter.nix
    ./harpoon.nix
    ./undotree.nix
    ./neogit.nix
    ./fugitive.nix
  ];

  options = {
    number = true;
    relativenumber = true;
    timeoutlen = 10;
    updatetime = 50;
    shiftwidth = 2;
    colorcolumn = 80;
    scrolloff = 8;
    smartindent = true;
    wrap = true;
    guicursor = "";
  };
}
