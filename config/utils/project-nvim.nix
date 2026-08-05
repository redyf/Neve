{ lib, config, ... }:
{
  options = {
    project-nvim.enable = lib.mkEnableOption "Enable project-nvim module";
  };
  config = lib.mkIf config.project-nvim.enable {
    plugins.project-nvim = {
      enable = true;
      # Loaded together with telescope (trigger_load in telescope's
      # luaConfig.post) so the `projects` picker works; the startup chdir is
      # deferred until the first telescope use.
      lazyLoad.settings.lazy = true;
    };
  };
}
