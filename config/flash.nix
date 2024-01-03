{
  plugins.flash = {
    enable = true;
    labels = "asdfghjklqwertyuiopzxcvbnm";
    search = {
      mode = "fuzzy";
    };
    jump = {
      autojump = true;
    };
    label = {
      uppercase = false;
      rainbow = {
        enabled = false;
        shade = 5;
      };
    };
  };
  keymaps = [
    {
      mode = ["n" "x" "o"];
      key = "s";
      action = "<cmd>lua require('flash').jump()<cr>";
    }
    {
      mode = ["n" "x" "o"];
      key = "S";
      action = "<cmd>lua require('flash').treesitter()<cr>";
    }
    {
      mode = "o";
      key = "r";
      action = "<cmd>lua require('flash').remote()<cr>";
    }
    {
      mode = ["x" "o"];
      key = "R";
      action = "<cmd>lua require('flash').treesitter_search()<cr>";
    }
  ];
}
