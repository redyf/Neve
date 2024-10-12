{
  lib,
  config,
  ...
}:
{
  imports = [
    ./luasnip.nix
  ];

  options = {
    snippets.enable = lib.mkEnableOption "Enable snippets module";
  };
  config = lib.mkIf config.snippets.enable {
    luasnip.enable = lib.mkDefault true;
  };
}
