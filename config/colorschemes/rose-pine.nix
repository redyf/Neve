{ lib, config, ... }:
{
  options = {
    rose-pine.enable = lib.mkEnableOption "Enable rose-pine module";
  };
  config = lib.mkIf config.rose-pine.enable {
    colorschemes = {
      rose-pine = {
        enable = true;
        settings = {
          styles = {
            italic = true;
            bold = true;
            transparency = false;
          };
        };
      };
    };
  };
}
