local dap = require('dap')
dap.adapters.gdb = {
  type = 'executable',
  command = 'gdb',
  args = { '-i', 'dap' },
}

dap.configurations.c = {
  {
    name = 'Launch',
    type = 'gdb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    stopAtBeginningOfMainSubprogram = false,
  },
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'gdb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    stopAtBeginningOfMainSubprogram = false,
  },
}
