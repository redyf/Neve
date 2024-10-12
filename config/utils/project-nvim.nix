{ lib, config, ... }:
{
  options = {
    project-nvim.enable = lib.mkEnableOption "Enable project-nvim module";
  };
  config = lib.mkIf config.project-nvim.enable {
    plugins.project-nvim = {
      enable = true;
      enableTelescope = true;
    };
  };
}
