{
  lib,
  config,
  ...
}:
{
  imports = [
    ./cmp.nix
    ./codeium.nix
    ./copilot.nix
    ./lspkind.nix
  ];

  options = {
    completion.enable = lib.mkEnableOption "Enable completion module";
  };
  config = lib.mkIf config.completion.enable {
    cmp.enable = lib.mkDefault true;
    codeium.enable = lib.mkDefault false;
    copilot.enable = lib.mkDefault false;
    lspkind.enable = lib.mkDefault true;
  };
}
