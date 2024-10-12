{ lib, config, ... }:
{
  options = {
    web-devicons.enable = lib.mkEnableOption "Enable web-devicons module";
  };
  config = lib.mkIf config.web-devicons.enable {
    plugins.web-devicons = {
      enable = true;
    };
  };
}
