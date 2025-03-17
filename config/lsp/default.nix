{
  lib,
  config,
  ...
}:
{
  imports = [
    ./conform.nix
    ./fidget.nix
    ./lsp-nvim.nix
    ./lspsaga.nix
    ./trouble.nix
  ];

  options = {
    lsp.enable = lib.mkEnableOption "Enable lsp module";
  };
  config = lib.mkIf config.lsp.enable {
    conform.enable = lib.mkDefault true;
    fidget.enable = lib.mkDefault true;
    lsp-nvim.enable = lib.mkDefault true;
    lspsaga.enable = lib.mkDefault false;
    trouble.enable = lib.mkDefault true;
  };
}
