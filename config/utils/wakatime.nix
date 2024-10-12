{ lib, config, ... }:
{
  options = {
    wakatime.enable = lib.mkEnableOption "Enable wakatime module";
  };
  config = lib.mkIf config.wakatime.enable {
    plugins.wakatime = {
      enable = true;
    };
  };
}
