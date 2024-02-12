{
  plugins.hardtime = {
    enable = true;
    enabled = false;
    disableMouse = true;
    disabledFiletypes = ["neo-tree" "qf" "netrw" "NvimTree"];
    hint = true;
    maxCount = 4;
    maxTime = 1000;
    restrictionMode = "hint";
    restrictedKeys = {
      "h" = ["n" "x"];
      "j" = ["n" "x"];
      "k" = ["n" "x"];
      "l" = ["n" "x"];
      "-" = ["n" "x"];
      "+" = ["n" "x"];
      "gj" = ["n" "x"];
      "gk" = ["n" "x"];
      "<CR>" = ["n" "x"];
      "<C-M>" = ["n" "x"];
      "<C-N>" = ["n" "x"];
      "<C-P>" = ["n" "x"];
    };
  };
}
