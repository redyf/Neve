{
  globals.mapleader = " ";

  keymaps = [
    # Save file (C-s is also available)
    {
      mode = "n";
      key = "<leader>ww";
      action = "<cmd>w<cr><esc>";
    }

    # Quit
    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>quitall<cr><esc>";
    }

    # -- go to next/previous buffer
    {
      mode = "n";
      key = "<Tab>";
      action = "<cmd>BufferLineCycleNext<cr>";
      options.silent = true;
    }
    {
      mode = "n";
      key = "<S-Tab>";
      action = "<cmd>BufferLineCyclePrev<cr>";
      options.silent = true;
    }

    # Enable line numbers/relative
    {
      mode = "n";
      key = "<leader>ul";
      action = "<cmd>set number<CR>";
    }
    {
      mode = "n";
      key = "<leader>uL";
      action = "<cmd>set relativenumber<CR>";
    }
    # Use move command when line is highlighted so you can move then
    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
    }
    {
      mode = "v";
      key = "K";
      action = ":m '>-2<CR>gv=gv";
    }
    # Allow cursor to stay in the same place after appending to current line
    {
      mode = "n";
      key = "J";
      action = "mzJ`z";
    }
    # Allow C-d and C-u to keep the cursor in the middle
    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
    }
    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
    }
    # Allow search terms to stay in the middle
    {
      mode = "n";
      key = "n";
      action = "nzzzv";
    }
    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
    }
    # Paste stuff without saving the deleted word into the buffer
    {
      mode = "n";
      key = "<leader>pp";
      action = "\"_dP";
    }
    # Copy stuff to system clipboard with <leader> + y or just y to have it just in vim
    {
      mode = "n";
      key = "<leader>y";
      action = "\"+y";
    }
    {
      mode = "v";
      key = "<leader>y";
      action = "\"+y";
    }
    {
      mode = "n";
      key = "<leader>Y";
      action = "\"+Y";
    }
    # Delete to void register
    {
      mode = "n";
      key = "<leader>d";
      action = "\"_d";
    }
    {
      mode = "v";
      key = "<leader>d";
      action = "\"_d";
    }
    {
      mode = "i";
      key = "<C-c>";
      action = "<Esc>";
    }
    # Switch between projects
    {
      mode = "n";
      key = "<C-f>";
      action = "!tmux new tmux-sessionizer<CR>";
      options = {
        silent = true;
      };
    }
  ];
}
