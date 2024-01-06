{
  pkgs,
  lib,
  config,
  ...
}: {
  globalOptions = {
    # Block cursor
    guicursor = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor";
    cursorline = false; # Highlight the line where the cursor is located

    # Enable relative line numbers
    number = true;
    relativenumber = true;

    # Tab spacing
    tabstop = 4; # insert 4 spaces for a tab
    softtabstop = 4;
    shiftwidth = 4; # insert 4 spaces for each indentation
    expandtab = true;

    smartindent = true;

    wrap = false;

    # Undo stuff from days ago
    swapfile = false;
    backup = false;
    undofile = true;

    # Incremental search
    hlsearch = false;
    incsearch = true;

    # Better colors
    termguicolors = true;

    scrolloff = 8; # Will never have less than 8 characters as you scroll down
    signcolumn = "yes";
    updatetime = 50; # faster completion (4000ms default)
    colorcolumn = "80";
    # Mouse
    mouse = "a";
    timeoutlen = 10;
    encoding = "utf-8";
    fileencoding = "utf-8";
  };
}
