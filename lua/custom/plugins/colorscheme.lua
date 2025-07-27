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
          PythonFString = { fg = '#e5c07b', fmt = 'bold' },
          JSTemplateLiteral = { fg = '#e5c07b', fmt = 'bold' },
          CustomBrackets = { fg = '#56b6c2' },
          HTMLTag = { fg = '#c678dd', fmt = 'bold' },
          HTMLAttr = { fg = '#98c379' },
          CSSProperty = { fg = '#c678dd' },
          CSSSelector = { fg = '#e5c07b', fmt = 'bold' },
          Function = { fg = '#61afef', fmt = 'bold' },
        }
      }
      vim.cmd.colorscheme 'onedark'
    end,
  },
}
