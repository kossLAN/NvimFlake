-- Exit if the language server isn't available
if vim.fn.executable('jdtls') ~= 1 then
  return
end

local root_files = {
  '.git',
  'Main.java',
}

vim.lsp.start {
  name = 'jdtls',
  cmd = { 'jdtls' },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
}
