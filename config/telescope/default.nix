{
  lib,
  config,
  ...
}:
{
  imports = [
    ./telescope-nvim.nix
  ];

  options = {
    telescope.enable = lib.mkEnableOption "Enable telescope module";
  };
  config = lib.mkIf config.telescope.enable {
    telescope-nvim.enable = lib.mkDefault true;
  };
}
