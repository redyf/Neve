{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    vim-be-good
  ];
}
