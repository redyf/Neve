{ pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [
    nvim-surround
  ];
}
