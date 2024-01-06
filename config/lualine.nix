{
  plugins.lualine = {
    enable = true;
    alwaysDivideMiddle = true;
    ignoreFocus = ["neo-tree"];
    extensions = ["fzf"];
    theme = "auto";
    componentSeparators = {
      left = "|";
      right = "|";
    };
    sectionSeparators = {
      left = ""; # 
      right = ""; # 
    };
    sections = {
      lualine_a = ["mode"];
      lualine_b = ["branch" "diff" "diagnostics"];
      lualine_c = ["filename"];
      lualine_x = ["filetype"];
      lualine_y = ["progress"];
      lualine_z = [''" " .. os.date("%R")''];
    };
  };
}
