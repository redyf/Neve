# Thanks for the keybinds primeagen and folke!
{
  globals.mapleader = " ";

  keymaps = [
    # General maps
    {
      key = "<leader>f";
      action = "+find/file";
    }

    {
      key = "<leader>s";
      action = "+search";
    }

    {
      key = "<leader>q";
      action = "+quit/session";
    }

    {
      key = "<leader>u";
      action = "+ui";
    }

    {
      key = "<leader>w";
      action = "+windows";
    }

    {
      key = "<leader><Tab>";
      action = "+tab";
    }

    # Tabs
    {
      mode = "n";
      key = "<leader><tab>l";
      action = "<cmd>tablast<cr>";
      options = {
        silent = true;
        desc = "Last tab";
      };
    }
    {
      mode = "n";
      key = "<leader><tab>f";
      action = "<cmd>tabfirst<cr>";
      options = {
        silent = true;
        desc = "First Tab";
      };
    }
    {
      mode = "n";
      key = "<leader><tab><tab>";
      action = "<cmd>tabnew<cr>";
      options = {
        silent = true;
        desc = "New Tab";
      };
    }
    {
      mode = "n";
      key = "<leader><tab>]";
      action = "<cmd>tabnext<cr>";
      options = {
        silent = true;
        desc = "Next Tab";
      };
    }
    {
      mode = "n";
      key = "<leader><tab>d";
      action = "<cmd>tabclose<cr>";
      options = {
        silent = true;
        desc = "Close tab";
      };
    }
    {
      mode = "n";
      key = "<leader><tab>[";
      action = "<cmd>tabprevious<cr>";
      options = {
        silent = true;
        desc = "Previous Tab";
      };
    }

    # Windows
    {
      mode = "n";
      key = "<leader>ww";
      action = "<C-W>p";
      options = {
        silent = true;
        desc = "Other window";
      };
    }

    {
      mode = "n";
      key = "<leader>wd";
      action = "<C-W>c";
      options = {
        silent = true;
        desc = "Delete window";
      };
    }

    {
      mode = "n";
      key = "<leader>w-";
      action = "<C-W>s";
      options = {
        silent = true;
        desc = "Split window below";
      };
    }
    {
      mode = "n";
      key = "<leader>w|";
      action = "<C-W>v";
      options = {
        silent = true;
        desc = "Split window right";
      };
    }

    {
      mode = "n";
      key = "<leader>-";
      action = "<C-W>s";
      options = {
        silent = true;
        desc = "Split window below";
      };
    }

    {
      mode = "n";
      key = "<leader>|";
      action = "<C-W>v";
      options = {
        silent = true;
        desc = "Split window right";
      };
    }

    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd>w<cr><esc>";
      options = {
        silent = true;
        desc = "Save file";
      };
    }

    # Quit/Session
    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>quitall<cr><esc>";
      options = {
        silent = true;
        desc = "Quit all";
      };
    }
    {
      mode = "n";
      key = "<leader>qs";
      action = ":lua require('persistence').load()<cr>";
      options = {
        silent = true;
        desc = "Restore session";
      };
    }

    {
      mode = "n";
      key = "<leader>ql";
      action = "<cmd>lua require('persistence').load({ last = true })<cr>";
      options = {
        silent = true;
        desc = "Restore last session";
      };
    }

    {
      mode = "n";
      key = "<leader>qd";
      action = "<cmd>lua require('persistence').stop()<cr>";
      options = {
        silent = true;
        desc = "Don't save current session";
      };
    }

    {
      mode = "n";
      key = "<leader>ul";
      action = "<cmd>set number<CR>";
      options = {
        silent = true;
        desc = "Enable line numbers";
      };
    }

    {
      mode = "n";
      key = "<leader>uL";
      action = "<cmd>set relativenumber<CR>";
      options = {
        silent = true;
        desc = "Enable relative line numbers";
      };
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
