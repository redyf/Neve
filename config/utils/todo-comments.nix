{ lib, config, ... }:
{
  options = {
    todo-comments.enable = lib.mkEnableOption "Enable todo-comments module";
  };
  config = lib.mkIf config.todo-comments.enable {
    plugins.todo-comments = {
      enable = true;
    };
  };
}
