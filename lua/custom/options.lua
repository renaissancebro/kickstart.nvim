vim.opt.clipboard = 'unnamedplus'

-- F-string bracket highlighting with higher priority
vim.api.nvim_create_autocmd({'FileType', 'BufEnter', 'TextChanged', 'TextChangedI'}, {
  pattern = 'python',
  callback = function()
    -- Define highlight groups with high priority
    vim.api.nvim_set_hl(0, 'FStringBracket', { fg = '#ff6600', bold = true })
    vim.api.nvim_set_hl(0, 'FStringContent', { fg = '#00ff88', italic = true })
    
    -- Disable treesitter highlighting temporarily to test
    pcall(function()
      vim.cmd([[
        syntax enable
        syntax clear
        syntax match FStringBracket /[{}]/ containedin=ALL
        syntax region FStringContent start=/{/ end=/}/ containedin=ALL
      ]])
    end)
  end,
})

-- Also try overriding treesitter highlights with higher priority
vim.api.nvim_create_autocmd({'ColorScheme', 'VimEnter', 'BufEnter'}, {
  pattern = '*',
  callback = function()
    -- Override with higher priority
    vim.api.nvim_set_hl(0, '@punctuation.bracket', { fg = '#ff6600', bold = true })
    vim.api.nvim_set_hl(0, '@punctuation.delimiter', { fg = '#ff6600', bold = true })
  end,
})
