{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    ultimate-autopair.enable = lib.mkEnableOption "Enable ultimate-autopair module";
  };
  config = lib.mkIf config.ultimate-autopair.enable {

    extraPlugins = with pkgs.vimUtils; [
      (buildVimPlugin {
        pname = "ultimate-autopair.nvim";
        version = "2024-02-05";
        src = pkgs.fetchFromGitHub {
          owner = "altermo";
          repo = "ultimate-autopair.nvim";
          rev = "25c13e0ce167db0255456cac10158b27d2be30c0";
          sha256 = "0bsxfj6g8fii9nn92vl15hdhafx3fikgiz4srr7y10pxz01c5s4c";
        };
      })
    ];
    extraConfigLua = ''
      require('ultimate-autopair').setup()
    '';
  };
}
