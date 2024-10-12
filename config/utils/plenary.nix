{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    plenary.enable = lib.mkEnableOption "Enable plenary module";
  };
  config = lib.mkIf config.plenary.enable {
    extraPlugins = with pkgs.vimPlugins; [
      plenary-nvim
    ];
  };
}
