vim.opt.clipboard = 'unnamedplus'

-- Enhanced f-string highlighting
vim.api.nvim_create_autocmd({'ColorScheme', 'VimEnter'}, {
  callback = function()
    -- F-string specific highlighting groups
    vim.api.nvim_set_hl(0, '@string.special', { fg = '#ff9500', bold = true }) -- f-string prefix
    vim.api.nvim_set_hl(0, '@punctuation.delimiter', { fg = '#ffcc00', bold = true }) -- {} brackets
    vim.api.nvim_set_hl(0, '@embedded', { fg = '#00ff88', bg = '#2a2a3e' }) -- content inside {}
    vim.api.nvim_set_hl(0, '@string.interpolation', { fg = '#00ff88', bg = '#2a2a3e' }) -- interpolation content
    
    -- Also try these common treesitter groups for f-strings
    vim.api.nvim_set_hl(0, '@string.regex', { fg = '#ffcc00', bold = true })
    vim.api.nvim_set_hl(0, '@string.escape', { fg = '#ff6600', bold = true })
  end,
})
