{ lib, config, ... }:
{
  options = {
    diffview.enable = lib.mkEnableOption "Enable diffview module";
  };
  config = lib.mkIf config.diffview.enable {

    plugins.diffview = {
      enable = true;
    };
  };
}
