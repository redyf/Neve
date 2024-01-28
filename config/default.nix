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
    ./languages/treesitter/ts-context-commentstring.nix

    ./lsp/lsp.nix
    ./lsp/conform.nix
    ./lsp/trouble.nix

    ./none-ls/none-ls.nix

    ./snippets/luasnip.nix

    ./statusline/lualine.nix

    ./telescope/telescope.nix

    ./ui/alpha.nix
    ./ui/dressing-nvim.nix
    ./ui/indent-blankline.nix
    ./ui/noice.nix
    ./ui/nvim-notify.nix
    ./ui/nui.nix

    ./utils/better-escape.nix
    ./utils/discordrpc.nix
    ./utils/flash.nix
    ./utils/hardtime.nix
    ./utils/harpoon.nix
    ./utils/markdown-preview.nix
    ./utils/mini.nix
    ./utils/nvim-autopairs.nix
    ./utils/nvim-colorizer.nix
    ./utils/nvim-surround.nix
    ./utils/persistence.nix
    ./utils/plenary.nix
    ./utils/tmux-navigator.nix
    ./utils/todo-comments.nix
    ./utils/toggleterm.nix
    ./utils/undotree.nix
    ./utils/vim-be-good.nix
    ./utils/wakatime.nix
    ./utils/whichkey.nix
  ];
}
