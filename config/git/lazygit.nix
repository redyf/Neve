{ lib, config, ... }:
{
  options = {
    lazygit.enable = lib.mkEnableOption "Enable lazygit module";
  };
  config = lib.mkIf config.lazygit.enable {

    plugins.lazygit = {
      enable = true;
    };

    extraConfigLua = ''
      require("telescope").load_extension("lazygit")
    '';

    keymaps = [
      {
        mode = "n";
        key = "<leader>gg";
        action = "<cmd>LazyGit<CR>";
        options = {
          desc = "LazyGit (root dir)";
        };
      }
    ];
  };
}
