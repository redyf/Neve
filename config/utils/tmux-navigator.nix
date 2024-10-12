{ lib, config, ... }:
{
  options = {
    tmux-navigator.enable = lib.mkEnableOption "Enable tmux-navigator module";
  };
  config = lib.mkIf config.tmux-navigator.enable {
    plugins.tmux-navigator = {
      enable = true;
    };
  };
}
