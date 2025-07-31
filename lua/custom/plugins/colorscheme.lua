return {
  -- Tokyo Night theme (modern VS Code-style)
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup {
        style = 'night', -- 'storm', 'moon', 'night', 'day'
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = false, bold = true },
          functions = { bold = true },
          variables = {},
          sidebars = 'dark',
          floats = 'dark',
        },
        sidebars = { 'qf', 'help', 'vista_kind', 'terminal' },
        day_brightness = 0.3,
        hide_inactive_statusline = false,
        dim_inactive = false,
        lualine_bold = false,
        on_colors = function(colors)
          -- Enhanced colors for better differentiation
          colors.comment = '#565f89'
          colors.purple = '#bb9af7'
          colors.cyan = '#7dcfff'
          colors.green = '#9ecdda'
        end,
        on_highlights = function(hl, c)
          -- VS Code-style enhanced highlighting
          hl.Function = { fg = c.blue, bold = true }
          hl.Keyword = { fg = c.purple, bold = true }
          hl.String = { fg = c.green }
          hl.Number = { fg = c.orange }
          hl.Boolean = { fg = c.orange }
          hl.Type = { fg = c.cyan }
          hl.Operator = { fg = c.purple }
          hl.Delimiter = { fg = c.fg_dark }
          
          -- HTML specific highlighting
          hl.htmlTag = { fg = c.red }
          hl.htmlTagName = { fg = c.red, bold = true }
          hl.htmlArg = { fg = c.yellow }
          hl.htmlString = { fg = c.green }
          hl.htmlEndTag = { fg = c.red }
          
          -- CSS specific highlighting  
          hl.cssTagName = { fg = c.red, bold = true }
          hl.cssClassName = { fg = c.yellow }
          hl.cssIdentifier = { fg = c.yellow }
          hl.cssProp = { fg = c.cyan }
          hl.cssAttr = { fg = c.orange }
          hl.cssValueLength = { fg = c.orange }
          hl.cssValueNumber = { fg = c.orange }
          hl.cssValueKeyword = { fg = c.purple }
          hl.cssColor = { fg = c.orange }
          
          -- JavaScript/TypeScript specific highlighting
          hl.jsFunction = { fg = c.purple, bold = true }
          hl.jsReturn = { fg = c.purple, bold = true }
          hl.jsThis = { fg = c.purple, bold = true }
          hl.jsVariableDef = { fg = c.fg }
          hl.jsFuncCall = { fg = c.blue }
          hl.jsTemplateBraces = { fg = c.yellow, bold = true }
          hl.jsTemplateString = { fg = c.green }
          
          -- Python specific highlighting
          hl.pythonBuiltin = { fg = c.cyan }
          hl.pythonFunction = { fg = c.blue, bold = true }
          hl.pythonDecorator = { fg = c.yellow }
          hl.pythonException = { fg = c.red }
        end,
      }
      vim.cmd.colorscheme 'tokyonight'
    end,
  },
  
  -- Keep OneDark as alternative
  {
    'navarasu/onedark.nvim',
    lazy = true,
  },
}
