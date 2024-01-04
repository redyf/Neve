{
  inputs,
  self,
  pkgs,
  ...
}: {
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
    ./colorscheme.nix
    ./keymaps.nix
    ./whichkey.nix
    ./telescope.nix
    ./treesitter.nix
    ./harpoon.nix
    ./undotree.nix
    ./neogit.nix
    # ./fugitive.nix
    ./lsp.nix
    ./cmp.nix
    ./luasnip.nix
    ./sets.nix
    ./nvim-autopairs.nix
    ./flash.nix
    ./tmux-navigator.nix
    ./todo-comments.nix
    ./ts-autotag.nix
    ./noice.nix
    ./trouble.nix
    ./neo-tree.nix
    ./floaterm.nix
    ./gitsigns.nix
    # ./neocord.nix
    ./discordrpc.nix
  ];
}
