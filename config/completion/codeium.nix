{ lib, config, ... }:
{
  options = {
    codeium.enable = lib.mkEnableOption "Enable codeium module";
  };
  config = lib.mkIf config.codeium.enable {

    plugins.codeium-vim = {
      enable = true;
    };
  };
}
