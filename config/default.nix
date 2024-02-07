{ inputs
, self
, pkgs
, ...
}: {
  # Import all your configuration modules here
  imports = [
    ./sets.nix
    ./keymaps.nix

    ./bufferlines/bufferline.nix

    ./colorschemes/base16.nix
    ./colorschemes/catppuccin.nix
    ./colorschemes/rose-pine.nix

    ./completion/cmp.nix
    ./completion/copilot.nix
    ./completion/lspkind.nix

    ./dap/dap.nix

    ./filetrees/neo-tree.nix

    ./git/gitsigns.nix
    ./git/lazygit.nix
    ./git/neogit.nix

    ./languages/nvim-jdtls.nix
    ./languages/nvim-lint.nix
    ./languages/typescript-tools-nvim.nix
    ./languages/treesitter/treesitter.nix
    ./languages/treesitter/treesitter-context.nix
    ./languages/treesitter/treesitter-textobjects.nix
    ./languages/treesitter/ts-autotag.nix
    ./languages/treesitter/ts-context-commentstring.nix

    ./lsp/conform.nix
    ./lsp/fidget.nix
    ./lsp/lsp.nix
    ./lsp/lspsaga.nix
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
    ./utils/illuminate.nix
    ./utils/markdown-preview.nix
    ./utils/mini.nix
    ./utils/neodev.nix
    ./utils/neotest.nix
    ./utils/nvim-autopairs.nix
    ./utils/nvim-colorizer.nix
    ./utils/nvim-surround.nix
    ./utils/oil.nix
    ./utils/persistence.nix
    ./utils/plenary.nix
    ./utils/project-nvim.nix
    ./utils/tmux-navigator.nix
    ./utils/todo-comments.nix
    ./utils/toggleterm.nix
    ./utils/ultimate-autopairs.nix
    ./utils/undotree.nix
    ./utils/vim-be-good.nix
    ./utils/wakatime.nix
    ./utils/whichkey.nix
    ./utils/wilder.nix
  ];
}
