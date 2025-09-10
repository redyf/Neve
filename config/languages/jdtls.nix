{ lib, config, ... }:
let
  javaTestPath = "/nix/store/j3nvmhvj2pmnykw5pbm51dn0bz4cv6j3-vscode-extension-vscjava-vscode-java-test-0.38.2023032402/share/vscode/extensions/vscjava.vscode-java-test/server/com.microsoft.java.test.plugin-0.38.2.jar
 ";
in
{
  options = {
    jdtls.enable = lib.mkEnableOption "Enable jdtls module";
  };
  config = lib.mkIf config.jdtls.enable {
    plugins.jdtls = {
      enable = true;
      settings = {
        cmd = [
          "/nix/store/l7wd7xjnz95yxv225kix5gbq8k3vm7fl-jdt-language-server-1.48.0/bin/jdtls --data ~/.cache/jdtls/workspace"
        ];
        # configuration = "/path/to/configuration";
        settings = {
          java = {
            signatureHelp = true;
            completion = true;
          };
        };
        initOptions = {
          bundles = [
            "/nix/store/b9ib40q36wxjl4xs5lng263lflz1fsi7-vscode-extension-vscjava-vscode-java-debug-0.49.2023032407/share/vscode/extensions/vscjava.vscode-java-debug/server/com.microsoft.java.debug.plugin-0.44.0.jar"
            "${javaTestPath}"
          ];
        };
      };
    };
  };
}
#
# extraConfigLua = ''
#   local jdtls = require("jdtls")
#   local cmp_nvim_lsp = require("cmp_nvim_lsp")
#
#   local root_dir = require("jdtls.setup").find_root({ "packageInfo" }, "Config")
#   local home = os.getenv("HOME")
#   local eclipse_workspace = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
#
#   local ws_folders_jdtls = {}
#   if root_dir then
#    local file = io.open(root_dir .. "/.bemol/ws_root_folders")
#    if file then
#     for line in file:lines() do
#      table.insert(ws_folders_jdtls, "file://" .. line)
#     end
#     file:close()
#    end
#   end
#
#   -- for completions
#   local client_capabilities = vim.lsp.protocol.make_client_capabilities()
#   local capabilities = cmp_nvim_lsp.default_capabilities(client_capabilities)
#
#   local config = {
#    capabilities = capabilities,
#    cmd = {
#     "${pkgs.jdt-language-server}/bin/jdt-language-server",
#     "--jvm-arg=-javaagent:" .. home .. "/Developer/lombok.jar",
#     "-data",
#     eclipse_workspace,
#     "--add-modules=ALL-SYSTEM",
#    },
#    root_dir = root_dir,
#    init_options = {
#     workspaceFolders = ws_folders_jdtls,
#    },
#    settings = {
#      java = {
#        signatureHelp = { enabled = true},
#        completion = { enabled = true },
#      },
#    },
#    on_attach = function(client, bufnr)
#       local opts = { silent = true, buffer = bufnr }
#       vim.keymap.set('n', "<leader>lo", jdtls.organize_imports, { desc = 'Organize imports', buffer = bufnr })
#       vim.keymap.set('n', "<leader>df", jdtls.test_class, opts)
#       vim.keymap.set('n', "<leader>dn", jdtls.test_nearest_method, opts)
#       vim.keymap.set('n', '<leader>rv', jdtls.extract_variable_all, { desc = 'Extract variable', buffer = bufnr })
#       vim.keymap.set('n', '<leader>rc', jdtls.extract_constant, { desc = 'Extract constant', buffer = bufnr })
#     end
#   }
#
#   jdtls.start_or_attach(config)
# '';
