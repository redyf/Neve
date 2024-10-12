{ lib, config, ... }:
{
  options = {
    nvim-autopairs.enable = lib.mkEnableOption "Enable nvim-autopairs module";
  };
  config = lib.mkIf config.nvim-autopairs.enable {
    plugins.nvim-autopairs = {
      enable = true;
    };
  };
}
