{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    typescript-tools-nvim
  ];
}
