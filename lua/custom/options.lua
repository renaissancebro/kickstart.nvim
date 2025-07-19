vim.opt.clipboard = 'unnamedplus'

-- Debug command to see treesitter groups
vim.api.nvim_create_user_command('TSHighlight', function()
  local ts_utils = require('nvim-treesitter.ts_utils')
  local node = ts_utils.get_node_at_cursor()
  if node then
    print("Node type: " .. node:type())
    local hl_group = vim.treesitter.get_captures_at_cursor(0)
    for _, capture in ipairs(hl_group) do
      print("Highlight group: @" .. capture)
    end
  end
end, {})

-- Enhanced f-string highlighting - trying all possible groups
vim.api.nvim_create_autocmd({'ColorScheme', 'VimEnter'}, {
  callback = function()
    -- Try multiple possible f-string highlight groups
    local fstring_highlights = {
      '@string.special',
      '@string.interpolation', 
      '@string.escape',
      '@punctuation.delimiter',
      '@punctuation.bracket',
      '@embedded',
      '@variable.builtin',
      '@keyword.operator',
      '@operator',
      -- Language specific
      '@string.special.python',
      '@string.interpolation.python',
      '@punctuation.delimiter.python',
      '@punctuation.bracket.python',
      '@embedded.python',
    }
    
    for _, group in ipairs(fstring_highlights) do
      vim.api.nvim_set_hl(0, group, { fg = '#ffcc00', bold = true })
    end
  end,
})
