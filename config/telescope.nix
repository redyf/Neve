{
  plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>pf" = {
        action = "find_files, {}";
        desc = "Find project files";
      };
      "<C-p>" = {
        action = "git_files, {}";
        desc = "Search git files";
      };
      "<leader>ps" = {
        action = "live_grep";
        desc = "Project search";
      };
    };
  };
}
