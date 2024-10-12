{ lib, config, ... }:
{
  options = {
    mini.enable = lib.mkEnableOption "Enable mini module";
  };
  config = lib.mkIf config.mini.enable {
    plugins.mini = {
      enable = true;
      modules = {
        comment = {
          options = {
            customCommentString = ''
              <cmd>lua require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring<cr>
            '';
          };
        };
        cursorword = {
          opts = {
            delay = 100;
          };
        };
      };
    };
  };
}
