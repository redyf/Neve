{ pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [
    plenary-nvim
  ];
}
