-- Copilot related plugins setup
-- require('CopilotChat').setup {
--   debug = true,
-- }

require('copilot_cmp').setup()

require('copilot').setup {
  suggestion = { enabled = false },
  panel = { enabled = false },
  filetypes = {
    ['java'] = true,
    -- ['*'] = false,
  },
}
