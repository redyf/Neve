{ lib, config, ... }:
{
  options = {
    better-escape.enable = lib.mkEnableOption "Enable better-escape module";
  };
  config = lib.mkIf config.better-escape.enable {
    plugins.better-escape = {
      enable = true;
      settings = {
        timeout = 200;
        default_mappings = false;
        mappings = {
          i = {
            j = {
              k = "<Esc>";
              j = "<Esc>";
            };
          };
          c = {
            j = {
              k = "<Esc>";
              j = "<Esc>";
            };
          };
          v = {
            j = {
              k = "<Esc>";
            };
          };
          s = {
            j = {
              k = "<Esc>";
            };
          };
        };
      };
    };
  };
}
