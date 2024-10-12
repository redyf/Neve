{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    nui.enable = lib.mkEnableOption "Enable nui module";
  };
  config = lib.mkIf config.nui.enable {
    extraPlugins = with pkgs.vimPlugins; [ nui-nvim ];
  };
}
