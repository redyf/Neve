{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    typescript-tools-nvim
  ];
  extraConfigLua = ''
    require("typescript-tools").setup {}
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>co";
      action = "<cmd>TSToolsOrganizeImports<cr>";
      options = {
        desc = "Organize Imports";
      };
    }
    {
      mode = "n";
      key = "<leader>cR";
      action = "<cmd>TSToolsRemoveUnusedImports<cr>";
      options = {
        desc = "Remove Unused Imports";
      };
    }
  ];
}
