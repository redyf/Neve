{ pkgs
, lib
, config
, ...
}: {
  config = {
    # TODO: Organize the options
    options = {
      cmdheight = 2; # more space in the neovim command line for displaying messages
      completeopt = [ "menuone" "noselect" "noinsert" ]; # mostly just for cmp
      showmode = false; # we don't need to see things like INSERT anymore
      # Block cursor
      guicursor = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor";
      cursorline = true; # Highlight the line where the cursor is located

      # Enable relative line numbers
      number = true;
      relativenumber = true;

      # Tab spacing
      tabstop = 2; # insert 4 spaces for a tab
      softtabstop = 2;
      shiftwidth = 2; # insert 4 spaces for each indentation
      showtabline = 2;
      expandtab = true;

      smartindent = true;

      wrap = true;

      # Undo stuff from days ago
      swapfile = false;
      backup = false;
      undofile = true;

      # Search
      hlsearch = true;
      incsearch = true;
      ignorecase = true;
      smartcase = true; # Don't ignore case with capitals
      grepprg = "rg --vimgrep";
      grepformat = "%f:%l:%c:%m";

      # Better colors
      termguicolors = true;

      scrolloff = 8; # Will never have less than 8 characters as you scroll down
      signcolumn = "yes";
      updatetime = 50; # faster completion (4000ms default)
      colorcolumn = "80";
      mouse = "a"; # Mouse
      timeoutlen = 10;
      encoding = "utf-8";
      fileencoding = "utf-8";
      # Enable chars list
      list = true; # Show invisible characters (tabs, eol, ...)
      listchars = "eol:↲,tab:|->,lead:·,space: ,trail:•,extends:→,precedes:←,nbsp:␣";
    };
    extraConfigLua = ''
      local opt = vim.opt
      local g = vim.g
      local o = vim.o
        -- Neovide
      if g.neovide then
        -- Neovide options
        g.neovide_fullscreen = false
        g.neovide_hide_mouse_when_typing = false
        g.neovide_refresh_rate = 165
        g.neovide_cursor_vfx_mode = "ripple"
        g.neovide_cursor_animate_command_line = true
        g.neovide_cursor_animate_in_insert_mode = true
        g.neovide_cursor_vfx_particle_lifetime = 5.0
        g.neovide_cursor_vfx_particle_density = 14.0
        g.neovide_cursor_vfx_particle_speed = 12.0
        g.neovide_transparency = 0.8

        -- Neovide Fonts
        o.guifont = "MonoLisa Trial:Medium:h15"
        -- o.guifont = "CommitMono:Medium:h15"
        -- o.guifont = "JetBrainsMono Nerd Font:h14:Medium:i"
        -- o.guifont = "FiraMono Nerd Font:Medium:h14"
        -- o.guifont = "CaskaydiaCove Nerd Font:h14:b:i"
        -- o.guifont = "BlexMono Nerd Font Mono:h14:Medium:i"
        -- o.guifont = "Liga SFMono Nerd Font:b:h15"
      end
    '';
  };
}
