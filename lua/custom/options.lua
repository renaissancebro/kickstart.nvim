vim.opt.clipboard = 'unnamedplus'

-- F-string bracket highlighting
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    -- Define highlight group for f-string brackets
    vim.api.nvim_set_hl(0, 'FStringBracket', { fg = '#ffaa00', bold = true })
    
    -- Use vim syntax to match brackets inside f-strings
    vim.cmd([[
      syntax clear pythonStrFormat
      syntax match FStringBracket /{\|}/
    ]])
  end,
})
