{
  lib,
  config,
  ...
}:
{
  imports = [
    ./diffview.nix
    ./gitsigns.nix
    ./lazygit.nix
    ./neogit.nix
  ];

  options = {
    git.enable = lib.mkEnableOption "Enable git module";
  };
  config = lib.mkIf config.git.enable {
    diffview.enable = lib.mkDefault true;
    gitsigns.enable = lib.mkDefault true;
    lazygit.enable = lib.mkDefault true;
    neogit.enable = lib.mkDefault false;
  };
}
