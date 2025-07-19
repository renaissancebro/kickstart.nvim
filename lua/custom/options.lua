vim.opt.clipboard = 'unnamedplus'

-- Enhanced f-string highlighting
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    -- Define custom highlight groups for f-strings
    vim.api.nvim_set_hl(0, 'PythonFStringBrace', { fg = '#ffcc00', bold = true })
    vim.api.nvim_set_hl(0, 'PythonFStringContent', { fg = '#00ffaa', italic = true })
    
    -- Set up syntax matches for f-string components
    vim.cmd([[
      syntax match PythonFStringBrace /[{}]/ contained containedin=pythonString
      syntax region PythonFStringContent start=/{/ end=/}/ contained containedin=pythonString contains=pythonFStringBrace
    ]])
  end,
})

-- Alternative: Enhanced tree-sitter highlighting for f-strings
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function()
    -- Highlight f-string brackets
    vim.api.nvim_set_hl(0, '@string.special.python', { fg = '#ffcc00', bold = true })
    vim.api.nvim_set_hl(0, '@punctuation.delimiter.python', { fg = '#ff6600', bold = true })
    vim.api.nvim_set_hl(0, '@string.interpolation.python', { fg = '#00ffaa', italic = true, bg = '#1a1a2e' })
  end,
})
