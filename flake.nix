{
  description = "Neve is a Neovim configuration built with Nixvim, which allows you to use Nix language to manage Neovim plugins/options";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixvim,
      flake-utils,
      ...
    }@inputs:
    let
      config = import ./config; # import the module directly
      nixpkgsConfig = {
        allowUnfree = true;
      };
      # nixpkgs' `vimUtils.packDir` force-adds plugin `dependencies` to the
      # START pack. That would break lz.n lazy-loading of telescope/neotest:
      # their plugin/ scripts would run eagerly at startup, so `:Telescope` /
      # `:Neotest` would execute the real commands without lz.n's `after` hook
      # (setup + extensions never run). Strip the dependency metadata from the
      # plugins that declare telescope/neotest as dependencies — the lazy spec
      # (packadd) loads them on demand, and the dependent lua files only run on
      # `require`. The deps are moved to `nativeBuildInputs` so the nixpkgs
      # neovim-require-check-hook (which puts both `dependencies` and
      # `nativeBuildInputs` on the rtp) still passes at build time. See
      # LAZY_LOADING_PLAN.md.
      stripPluginDeps = final: prev: {
        vimPlugins =
          prev.vimPlugins
          // builtins.mapAttrs (
            _: pkg:
            pkg.overrideAttrs (old: {
              dependencies = [ ];
              nativeBuildInputs = (old.nativeBuildInputs or [ ]) ++ (old.dependencies or [ ]);
            })
          ) {
            inherit (prev.vimPlugins)
              telescope-fzf-native-nvim
              telescope-ui-select-nvim
              neotest-java
              neotest-python
              neotest-vitest
              neotest-plenary
              ;
          };
      };
    in
    {
      nixvimModule = config;
    }
    // flake-utils.lib.eachDefaultSystem (
      system:
      let
        nixvimLib = nixvim.lib.${system};
        pkgs = import nixpkgs {
          inherit system;
          config = nixpkgsConfig;
          overlays = [ stripPluginDeps ];
        };
        nixvim' = nixvim.legacyPackages.${system};
        nvim = nixvim'.makeNixvimWithModule {
          inherit pkgs;
          module = config;
          # You can use `extraSpecialArgs` to pass additional arguments to your module files
          extraSpecialArgs = {
            inherit self;
          };
        };
      in
      {
        checks = {
          # Run `nix flake check .` to verify that your config is not broken
          default =
            (nixvimLib.check.mkTestDerivationFromNvim {
              inherit nvim;
              name = "Neve";
            }).overrideAttrs
              (oldAttrs: {
                # Neovim 0.12 requires $HOME/.local/share/nvim for stdpath('data').
                # The nixvim test harness only creates .cache/nvim. Pre-create the
                # missing directory before running nvim.
                buildCommand = ''
                  mkdir -p .local/share/nvim
                ''
                + oldAttrs.buildCommand;
              });
        };

        packages = {
          # Lets you run `nix run .` to start nixvim
          default = nvim;
        };

        formatter = pkgs.nixfmt;
      }
    );
}
