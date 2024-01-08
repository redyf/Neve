{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    vim-wakatime
  ];
}
