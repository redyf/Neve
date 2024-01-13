{ pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [
    vim-startuptime
  ];
}
