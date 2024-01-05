{
  plugins.lualine = {
    enable = true;
    alwaysDivideMiddle = true;
    extensions = ["fzf"];
    sectionSeparators = {
      left = "";
      right = "";
    };
    sections = {
      lualine_a = [
        "mode"
      ];
      lualine_b = ["branch"];
      lualine_c = ["diagnostics"];
      lualine_x = [];
      lualine_y = ["progress"];
      lualine_z = [''" " .. os.date("%R")''];
    };
  };
}
