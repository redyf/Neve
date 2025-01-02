{ lib, config, ... }:
{
  options = {
    colorizer.enable = lib.mkEnableOption "Enable nvim-colorizer module";
  };
  config = lib.mkIf config.colorizer.enable {

    plugins.colorizer = {
      enable = true;
    };
  };
}
