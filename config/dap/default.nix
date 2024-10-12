{
  lib,
  config,
  ...
}:
{
  imports = [
    ./nvim-dap.nix
  ];

  options = {
    dap.enable = lib.mkEnableOption "Enable dap module";
  };
  config = lib.mkIf config.dap.enable {
    nvim-dap.enable = lib.mkDefault true;
  };
}
