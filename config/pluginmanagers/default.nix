{
  lib,
  config,
  ...
}:
{
  imports = [
    ./lazy-nvim.nix
  ];

  options = {
    pluginmanagers.enable = lib.mkEnableOption "Enable pluginmanagers module";
  };
  config = lib.mkIf config.pluginmanagers.enable {
    lazy-nvim.enable = lib.mkDefault true;
  };
}
