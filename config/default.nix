{
  inputs,
  self,
  pkgs,
  ...
}: {
  # TODO: Implement code actions

  # Import all your configuration modules here
  imports = [
    ./sets.nix
    ./keymaps.nix

    ./bufferlines/bufferline.nix

    ./colorschemes/colorscheme.nix

    ./completion/cmp.nix

    ./dap/dap.nix

    ./filetrees/neo-tree.nix

    ./git/gitsigns.nix
    ./git/neogit.nix

    ./languages/nvim-lint.nix
    ./languages/treesitter/treesitter.nix
    ./languages/treesitter/ts-autotag.nix

    ./lsp/lsp.nix
    ./lsp/conform.nix
    ./lsp/trouble.nix

    ./snippets/luasnip.nix

    ./statusline/lualine.nix

    ./telescope/telescope.nix

    ./ui/noice.nix

    ./utils/alpha.nix
    ./utils/better-escape.nix
    ./utils/discordrpc.nix
    ./utils/flash.nix
    ./utils/floaterm.nix
    ./utils/harpoon.nix
    ./utils/mini.nix
    ./utils/nvim-colorizer.nix
    ./utils/nvim-autopairs.nix
    ./utils/persistence.nix
    ./utils/todo-comments.nix
    ./utils/tmux-navigator.nix
    ./utils/undotree.nix
    ./utils/wakatime.nix
    ./utils/whichkey.nix
  ];
}
