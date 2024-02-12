{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    nvim-surround
  ];

  extraConfigLua = ''
    require("nvim-surround").setup()
  '';
}
