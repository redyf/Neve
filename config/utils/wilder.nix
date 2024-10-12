{ lib, config, ... }:
{
  options = {
    wilder.enable = lib.mkEnableOption "Enable wilder module";
  };
  config = lib.mkIf config.wilder.enable {
    plugins.wilder = {
      enable = true;
      modes = [
        ":"
        "/"
        "?"
      ];
      pipeline = [
        ''
          wilder.branch(
            wilder.python_file_finder_pipeline({
              file_command = function(ctx, arg)
              if string.find(arg, '.') ~= nil then
              return {'fd', '-tf', '-H'}
              else
              return {'fd', '-tf'}
              end
              end,
              dir_command = {'fd', '-td'},
              filters = {'cpsm_filter'},
              }),
              wilder.substitute_pipeline({
                pipeline = wilder.python_search_pipeline({
                  skip_cmdtype_check = 1,
                  pattern = wilder.python_fuzzy_pattern({
                    start_at_boundary = 0,
                  }),
                }),
              }),
              wilder.cmdline_pipeline({
                language = 'python',
                fuzzy = 1,
              }),
              {
                wilder.check(function(ctx, x) return x == "" end),
                wilder.history(),
              },
              wilder.python_search_pipeline({
                pattern = wilder.python_fuzzy_pattern({
                  start_at_boundary = 0,
                }),
              })
            )      
        ''
      ];
    };
  };
}
