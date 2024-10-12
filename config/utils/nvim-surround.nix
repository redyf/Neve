{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    nvim-surround.enable = lib.mkEnableOption "Enable nvim-surround module";
  };
  config = lib.mkIf config.nvim-surround.enable {
    plugins.nvim-surround = {
      enable = true;
    };
  };
}
