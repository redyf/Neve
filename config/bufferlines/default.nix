{
  lib,
  config,
  ...
}:
{
  imports = [
    ./bufferline.nix
  ];

  options = {
    bufferlines.enable = lib.mkEnableOption "Enable bufferlines module";
  };
  config = lib.mkIf config.bufferlines.enable {
    bufferline.enable = lib.mkDefault true;
  };
}
