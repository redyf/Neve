{ pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [
    typescript-tools-nvim
  ];
  extraConfigLua = ''
    require("typescript-tools").setup {}
  '';
}
