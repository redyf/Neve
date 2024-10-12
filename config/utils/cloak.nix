{ lib, config, ... }:
{
  options = {
    cloak.enable = lib.mkEnableOption "Enable cloak module";
  };
  config = lib.mkIf config.cloak.enable {
    plugins.cloak = {
      enable = true;
      settings = {
        cloak_character = "*";
        highlight_group = "Comment";
        patterns = [
          {
            file_pattern = [
              ".env*"
              "wrangler.toml"
              ".dev.vars"
            ];
            cloak_pattern = "=.+";
          }
        ];
      };
    };
  };
}
