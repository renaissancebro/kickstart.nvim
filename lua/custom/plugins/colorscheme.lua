return {
  -- Cyberdream theme (now active)
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('cyberdream').setup {
        transparent = false,
        italic_comments = true,
        hide_fillchars = false,
        borderless_telescope = true,
        terminal_colors = true,
        cache = false,
        
        -- VS Code-style highlighting with Cyberdream colors
        theme = {
          highlights = {
            -- VS Code-style f-string highlighting (adapted for Cyberdream)
            PythonFStringPrefix = { fg = '#bd5eff', style = 'bold' }, -- Purple for f-prefix
            PythonFStringBrace = { fg = '#ffbd5e', style = 'bold' },  -- Orange for {} braces
            JSTemplateBrace = { fg = '#ffbd5e', style = 'bold' },     -- Orange for ${} braces  
            CustomBrackets = { fg = '#5ef1ff' },                      -- Cyan for normal brackets
            HTMLTag = { fg = '#bd5eff', style = 'bold' },             -- Purple for HTML tags
            HTMLAttr = { fg = '#5eff6c' },                            -- Green for HTML attributes
            CSSProperty = { fg = '#bd5eff' },                         -- Purple for CSS properties
            CSSSelector = { fg = '#ffbd5e', style = 'bold' },         -- Orange for CSS selectors
            Function = { fg = '#5ea1ff', style = 'bold' },            -- Blue for functions
          }
        }
      }
      vim.cmd.colorscheme 'cyberdream'
    end,
  },
  
  -- Keep OneDark available but not active
  {
    'navarasu/onedark.nvim',
    lazy = true,
  },
}
