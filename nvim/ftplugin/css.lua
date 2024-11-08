-- Exit if the language server isn't available
if vim.fn.executable('vscode-css-language-server') ~= 1 then
  return
end

local root_files = {
  '.git',
}

vim.lsp.start {
  name = 'cssls',
  cmd = { 'vscode-css-language-server', '--stdio' },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
}
