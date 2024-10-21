-- Exit if the language server isn't available
if vim.fn.executable('rust-analyzer') ~= 1 then
  return
end

local root_files = {
  'Cargo.toml',
  'rust-project.json',
}

-- Tab Width
vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.expandtab = true

vim.lsp.start {
  name = 'rust-analyzer',
  cmd = { 'rust-analyzer' },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
  settings = {
    ['rust-analyzer'] = {
      diagnostics = { enable = false },
      imports = {
        granularity = {
          group = 'module',
        },
        prefix = 'self',
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true,
      },
    },
  },
}
