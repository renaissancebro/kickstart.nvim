vim.opt.clipboard = 'unnamedplus'

-- Enhanced f-string highlighting using tree-sitter
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    -- F-string brackets and interpolation
    vim.api.nvim_set_hl(0, '@punctuation.special.python', { fg = '#ffcc00', bold = true })
    vim.api.nvim_set_hl(0, '@string.escape.python', { fg = '#ff6600', bold = true })
    -- Content inside f-string braces
    vim.api.nvim_set_hl(0, '@variable.python', { fg = '#00ffaa' })
  end,
})

-- Trigger the highlighting on startup
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    -- Apply f-string highlighting
    vim.api.nvim_set_hl(0, '@punctuation.special.python', { fg = '#ffcc00', bold = true })
    vim.api.nvim_set_hl(0, '@string.escape.python', { fg = '#ff6600', bold = true })
  end,
})
