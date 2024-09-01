if vim.g.did_load_keymaps_plugin then
  return
end
vim.g.did_load_keymaps_plugin = true

local keymap = vim.keymap

-- Yank from current position till end of current line
keymap.set('n', 'Y', 'y$', { silent = true, desc = '[Y]ank to end of line' })

-- Buffer list navigation
keymap.set('n', '[b', vim.cmd.bprevious, { silent = true, desc = 'previous [b]uffer' })
keymap.set('n', ']b', vim.cmd.bnext, { silent = true, desc = 'next [b]uffer' })
keymap.set('n', '[B', vim.cmd.bfirst, { silent = true, desc = 'first [B]uffer' })
keymap.set('n', ']B', vim.cmd.blast, { silent = true, desc = 'last [B]uffer' })

-- Remap Esc to switch to normal mode and Ctrl-Esc to pass Esc to terminal
keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'switch to normal mode' })
keymap.set('t', '<C-Esc>', '<Esc>', { desc = 'send Esc to terminal' })

-- DAP Keymaps
vim.api.nvim_set_keymap(
  'n',
  '<leader>db',
  ':lua require"dap".toggle_breakpoint()<CR>',
  { noremap = true, silent = true, desc = 'debugger set [b]reakpoint' }
)

vim.api.nvim_set_keymap(
  'n',
  '<leader>dc',
  ':lua require"dap".continue()<CR>',
  { noremap = true, silent = true, desc = 'debugger [c]ontinue' }
)

vim.api.nvim_set_keymap(
  'n',
  '<leader>dn',
  ':lua require"dap".step_over()<CR>',
  { noremap = true, silent = true, desc = 'debugger [s]tep over' }
)

vim.api.nvim_set_keymap(
  'n',
  '<leader>di',
  ':lua require"dap".step_into()<CR>',
  { noremap = true, silent = true, desc = 'debugger [s]tep into' }
)

vim.api.nvim_set_keymap(
  'n',
  '<leader>dr',
  ':lua require"dap".repl.open()<CR>',
  { noremap = true, silent = true, desc = 'debugger [r]epl' }
)

--- Disabled keymaps [enable at your own risk]

-- Automatic management of search highlight
-- XXX: This is not so nice if you use j/k for navigation
-- (you should be using <C-d>/<C-u> and relative line numbers instead ;)
--
-- local auto_hlsearch_namespace = vim.api.nvim_create_namespace('auto_hlsearch')
-- vim.on_key(function(char)
--   if vim.fn.mode() == 'n' then
--     vim.opt.hlsearch = vim.tbl_contains({ '<CR>', 'n', 'N', '*', '#', '?', '/' }, vim.fn.keytrans(char))
--   end
-- end, auto_hlsearch_namespace)
