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
    ./lsp.nix
    ./cmp.nix
    ./luasnip.nix
    ./sets.nix
  ];
}
