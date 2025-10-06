{ lib, config, ... }:
{
  options = {
    lspkind.enable = lib.mkEnableOption "Enable lspkind module";
  };
  config = lib.mkIf config.lspkind.enable {

    plugins.lspkind = {
      enable = true;
      settings = {
        maxwidth = 50;
        ellipsis_char = "...";
        symbolMap = {
          Copilot = "";
        };
      };
    };
  };
}
