{
  lib,
  config,
  ...
}:
{
  imports = [
    ./neo-tree.nix
  ];

  options = {
    filetrees.enable = lib.mkEnableOption "Enable filetrees module";
  };
  config = lib.mkIf config.filetrees.enable {
    neo-tree.enable = lib.mkDefault true;
  };
}
