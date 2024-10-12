{ lib, config, ... }:
{
  options = {
    nvim-colorizer.enable = lib.mkEnableOption "Enable nvim-colorizer module";
  };
  config = lib.mkIf config.nvim-colorizer.enable {

    plugins.nvim-colorizer = {
      enable = true;
    };
  };
}
