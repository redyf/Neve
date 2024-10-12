{
  lib,
  config,
  ...
}:
{
  options = {
    lazy-nvim.enable = lib.mkEnableOption "Enable lazy-nvim module";
  };
  config = lib.mkIf config.lazy-nvim.enable {
    plugins.lazy = {
      enable = true;
    };
  };
}
