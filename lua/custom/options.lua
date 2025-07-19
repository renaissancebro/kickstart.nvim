vim.opt.clipboard = 'unnamedplus'

-- F-string bracket highlighting
vim.api.nvim_create_autocmd({'ColorScheme', 'VimEnter'}, {
  callback = function()
    -- Define the highlight group for f-string brackets
    vim.api.nvim_set_hl(0, '@punctuation.bracket.fstring', { 
      fg = '#ffaa00', 
      bold = true,
      bg = '#2a2a2a'
    })
  end,
})
