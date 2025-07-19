vim.opt.clipboard = 'unnamedplus'

-- F-string bracket highlighting
vim.api.nvim_create_autocmd({'ColorScheme', 'VimEnter', 'FileType'}, {
  callback = function()
    -- Define the highlight group for f-string brackets
    vim.api.nvim_set_hl(0, '@punctuation.bracket.fstring', { 
      fg = '#ffaa00', 
      bold = true,
      bg = '#2a2a2a'
    })
    
    -- Force treesitter to reload queries
    pcall(function()
      vim.treesitter.query.invalidate_cache()
    end)
  end,
})

-- Debug command to test highlighting
vim.api.nvim_create_user_command('TestFString', function()
  vim.api.nvim_set_hl(0, '@punctuation.bracket.fstring', { 
    fg = '#ff0000', 
    bold = true,
    bg = '#ffff00'
  })
  print("F-string highlight set to red on yellow")
end, {})
