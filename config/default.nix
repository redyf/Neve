{ inputs
, self
, pkgs
, ...
}: {
  # TODO: Implement code actions + more keybinds

  # Import all your configuration modules here
  imports = [
    ./sets.nix
    ./keymaps.nix

    ./bufferlines/bufferline.nix

    ./colorschemes/colorscheme.nix

    ./completion/cmp.nix
    ./completion/copilot.nix

    ./dap/dap.nix

    ./filetrees/neo-tree.nix

    ./git/gitsigns.nix
    ./git/lazygit.nix
    ./git/neogit.nix

    ./languages/nvim-lint.nix
    ./languages/typescript-tools-nvim.nix
    ./languages/treesitter/treesitter.nix
    ./languages/treesitter/treesitter-textobjects.nix
    ./languages/treesitter/ts-autotag.nix

    ./lsp/lsp.nix
    ./lsp/conform.nix
    ./lsp/trouble.nix

    ./none-ls/none-ls.nix

    ./snippets/luasnip.nix

    ./statusline/lualine.nix

    ./telescope/telescope.nix

    ./ui/dressing-nvim.nix
    ./ui/noice.nix
    ./ui/nui.nix

    ./utils/alpha.nix
    ./utils/better-escape.nix
    ./utils/discordrpc.nix
    ./utils/flash.nix
    ./utils/toggleterm.nix
    ./utils/harpoon.nix
    ./utils/markdown-preview.nix
    ./utils/mini.nix
    ./utils/nvim-colorizer.nix
    ./utils/nvim-autopairs.nix
    ./utils/persistence.nix
    ./utils/plenary.nix
    ./utils/todo-comments.nix
    ./utils/tmux-navigator.nix
    ./utils/ts-context-commentstring.nix
    ./utils/undotree.nix
    ./utils/wakatime.nix
    ./utils/whichkey.nix
  ];
}
