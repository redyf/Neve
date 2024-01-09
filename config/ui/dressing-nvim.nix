{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    dressing-nvim
  ];
}
