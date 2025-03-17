{
  lib,
  config,
  ...
}:
{
  imports = [
    ./set.nix
  ];

  options = {
    sets.enable = lib.mkEnableOption "Enable sets module";
  };
  config = lib.mkIf config.sets.enable {
    set.enable = lib.mkDefault true;
  };
}
