{ pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [ nui-nvim ];
}
