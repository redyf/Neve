{ lib, config, ... }:
{
  options = {
    base16.enable = lib.mkEnableOption "Enable base16 module";
  };
  config = lib.mkIf config.base16.enable {
    colorschemes = {
      base16 = {
        enable = false;
        colorscheme = "mountain";
      };
    };
  };
}
