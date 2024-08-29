-- Exit if the language server isn't available
if vim.fn.executable('java-language-server') ~= 1 then
  return
end

local root_files = {
  '.git',
  'Main.java',
}

vim.lsp.start {
  name = 'java_language_server',
  cmd = { 'java-language-server' },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
}
