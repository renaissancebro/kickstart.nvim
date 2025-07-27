return {
  -- Keep cyberdream but don't auto-load it
  {
    'scottmckendry/cyberdream.nvim',
    lazy = true,  -- Don't auto-load
  },
  
  -- OneDark theme (now active)
  {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'dark', -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
        transparent = false,
        code_style = {
          comments = 'italic',
          keywords = 'none',
          functions = 'bold',
          strings = 'none',
          variables = 'none'
        },
        colors = {}, -- Override default colors
        highlights = {
          -- Custom highlights for our syntax
          PythonFString = { fg = '#e06c75', fmt = 'bold' },       -- Bright red for f-strings
          JSTemplateLiteral = { fg = '#e06c75', fmt = 'bold' },   -- Bright red for template literals
          CustomBrackets = { fg = '#56b6c2' },                   -- Cyan for brackets
          HTMLTag = { fg = '#c678dd', fmt = 'bold' },            -- Purple for HTML tags
          HTMLAttr = { fg = '#98c379' },                         -- Green for HTML attributes
          CSSProperty = { fg = '#c678dd' },                      -- Purple for CSS properties
          CSSSelector = { fg = '#e5c07b', fmt = 'bold' },        -- Yellow for CSS selectors
          Function = { fg = '#61afef', fmt = 'bold' },           -- Blue for functions
        }
      }
      vim.cmd.colorscheme 'onedark'
    end,
  },
}
