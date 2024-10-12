{ lib, config, ... }:
{
  options = {
    which-key.enable = lib.mkEnableOption "Enable which-key module";
  };
  config = lib.mkIf config.which-key.enable {
    plugins.which-key = {
      enable = true;
      settings = {
        icons = {
          breadcrumb = "»";
          group = "+";
          separator = ""; # ➜
        };
        spec = [
          # Harpoon Configs
          {
            __unkeyed-1 = "<leader>h";
            mode = "n";
            group = "+harpoon";
            icon = "󱡁";
          }
          {
            __unkeyed-1 = "<leader>ha";
            mode = "n";
            group = "Add file to Harpoon";
          }
          {
            __unkeyed-1 = "<leader>hj";
            mode = "n";
            group = "Harpoon File 1";
          }
          {
            __unkeyed-1 = "<leader>hk";
            mode = "n";
            group = "Harpoon File 2";
          }
          {
            __unkeyed-1 = "<leader>hl";
            mode = "n";
            group = "Harpoon File 3";
          }
          {
            __unkeyed-1 = "<leader>hm";
            mode = "n";
            group = "Harpoon File 4";
          }

          # General Mappings
          {
            __unkeyed-1 = "<leader>c";
            mode = [
              "n"
              "v"
            ];
            group = "+code";
          }
          {
            __unkeyed-1 = "<leader>d";
            mode = [
              "n"
              "v"
            ];
            group = "+debug";
          }
          {
            __unkeyed-1 = "<leader>f";
            mode = "n";
            group = "+find/file";
          }

          {
            __unkeyed-1 = "<leader>g";
            mode = [
              "n"
              "v"
            ];
            group = "+git";
          }

          {
            __unkeyed-1 = "<leader>q";
            mode = "n";
            group = "+quit/session";
          }

          {
            __unkeyed-1 = "<leader>s";
            mode = "n";
            group = "+search";
          }
          {
            __unkeyed-1 = "<leader><Tab>";
            mode = "n";
            group = "+tab";
          }

          {
            __unkeyed-1 = "<leader>t";
            mode = "n";
            group = "+test";
          }

          {
            __unkeyed-1 = "<leader>u";
            mode = "n";
            group = "+ui";
          }

          {
            __unkeyed-1 = "<leader>w";
            mode = "n";
            group = "+windows";
          }
        ];
        win = {
          border = "none";
          wo.winblend = 0;
        };
      };
    };
  };
}
