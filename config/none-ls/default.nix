{
  lib,
  config,
  ...
}:
{
  imports = [
    ./none-ls-nvim.nix
  ];

  options = {
    none-ls.enable = lib.mkEnableOption "Enable none-ls module";
  };
  config = lib.mkIf config.none-ls.enable {
    none-ls-nvim.enable = lib.mkDefault true;
  };
}
