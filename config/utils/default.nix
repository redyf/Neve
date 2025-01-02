{
  lib,
  config,
  ...
}:
{
  imports = [
    ./better-escape.nix
    ./cloak.nix
    ./colorizer.nix
    ./harpoon.nix
    ./markdown-preview.nix
    ./mini.nix
    ./neocord.nix
    ./neotest.nix
    ./nvim-autopairs.nix
    ./nvim-surround.nix
    ./nvterm.nix
    ./oil.nix
    ./persistence.nix
    ./plenary.nix
    ./project-nvim.nix
    ./sidebar.nix
    ./tmux-navigator.nix
    ./todo-comments.nix
    ./ultimate-autopair.nix
    ./undotree.nix
    ./wakatime.nix
    ./which-key.nix
    ./wilder.nix
  ];

  options = {
    utils.enable = lib.mkEnableOption "Enable utils module";
  };
  config = lib.mkIf config.utils.enable {
    better-escape.enable = lib.mkDefault true;
    cloak.enable = lib.mkDefault true;
    harpoon.enable = lib.mkDefault true;
    markdown-preview.enable = lib.mkDefault false;
    mini.enable = lib.mkDefault true;
    neocord.enable = lib.mkDefault true;
    neotest.enable = lib.mkDefault true;
    nvim-autopairs.enable = lib.mkDefault true;
    colorizer.enable = lib.mkDefault true;
    nvim-surround.enable = lib.mkDefault true;
    nvterm.enable = lib.mkDefault true;
    oil.enable = lib.mkDefault true;
    persistence.enable = lib.mkDefault true;
    plenary.enable = lib.mkDefault true;
    project-nvim.enable = lib.mkDefault true;
    sidebar.enable = lib.mkDefault false;
    tmux-navigator.enable = lib.mkDefault true;
    todo-comments.enable = lib.mkDefault true;
    ultimate-autopair.enable = lib.mkDefault true;
    undotree.enable = lib.mkDefault true;
    wakatime.enable = lib.mkDefault true;
    which-key.enable = lib.mkDefault true;
    wilder.enable = lib.mkDefault false;
  };
}
