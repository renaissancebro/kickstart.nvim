vim.opt.clipboard = 'unnamedplus'

-- F-string highlighting using treesitter
vim.api.nvim_create_autocmd({'FileType', 'BufEnter'}, {
  pattern = 'python',
  callback = function()
    -- Set up treesitter highlight overrides for f-strings
    vim.api.nvim_set_hl(0, '@string.special', { fg = '#ff6600', bold = true })
    vim.api.nvim_set_hl(0, '@punctuation.bracket', { fg = '#ffaa00', bold = true })
    vim.api.nvim_set_hl(0, '@punctuation.delimiter', { fg = '#ffaa00', bold = true })
    
    -- Try to override the specific f-string components
    local ok, query = pcall(vim.treesitter.query.get, 'python', 'highlights')
    if ok then
      -- Add custom highlight for f-string brackets
      vim.api.nvim_set_hl(0, 'FStringBracket', { fg = '#ffaa00', bold = true })
      
      -- Use a more aggressive approach - highlight all brackets in python
      vim.schedule(function()
        local bufnr = vim.api.nvim_get_current_buf()
        local ns = vim.api.nvim_create_namespace('fstring_brackets')
        
        -- Clear previous highlights
        vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
        
        -- Find and highlight brackets
        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
        for line_num, line in ipairs(lines) do
          -- Look for f-strings and highlight their brackets
          if line:match('f["\']') then
            local start_pos = 0
            while true do
              local bracket_pos = line:find('[{}]', start_pos + 1)
              if not bracket_pos then break end
              
              vim.api.nvim_buf_set_extmark(bufnr, ns, line_num - 1, bracket_pos - 1, {
                end_col = bracket_pos,
                hl_group = 'FStringBracket'
              })
              start_pos = bracket_pos
            end
          end
        end
      end)
    end
  end,
})
