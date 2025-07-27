-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Tree-sitter configuration
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'python', 'lua', 'vim', 'vimdoc', 'query' },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      }
      
      -- Custom highlight groups for f-strings and brackets
      vim.api.nvim_set_hl(0, 'PythonFString', { fg = '#fab387', bold = true }) -- Orange f-strings
      vim.api.nvim_set_hl(0, 'PythonBrackets', { fg = '#89dceb' }) -- Cyan brackets
      
      -- Apply custom highlights after colorscheme loads
      vim.api.nvim_create_autocmd('ColorScheme', {
        callback = function()
          vim.api.nvim_set_hl(0, 'PythonFString', { fg = '#fab387', bold = true })
          vim.api.nvim_set_hl(0, 'PythonBrackets', { fg = '#89dceb' })
        end,
      })
    end,
  },
  
  -- Catppuccin colorscheme
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
        background = {
          light = 'latte',
          dark = 'mocha',
        },
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = false,
        dim_inactive = {
          enabled = false,
          shade = 'dark',
          percentage = 0.15,
        },
        no_italic = false,
        no_bold = false,
        no_underline = false,
        styles = {
          comments = { 'italic' },
          conditionals = { 'italic' },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {},
        custom_highlights = function(colors)
          return {
            PythonFString = { fg = colors.peach, style = { 'bold' } },
            PythonBrackets = { fg = colors.sky },
          }
        end,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = false,
        },
      })
      
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
  
  -- Mini.hipatterns for enhanced f-string highlighting
  {
    'echasnovski/mini.hipatterns',
    version = false,
    config = function()
      local hipatterns = require('mini.hipatterns')
      hipatterns.setup({
        highlighters = {
          -- Python f-strings
          fstring = {
            pattern = "f['\"].-['\"]",
            group = 'PythonFString',
          },
          -- Enhanced bracket highlighting
          brackets = {
            pattern = '[()%[%]{}]',
            group = 'PythonBrackets',
          },
        },
      })
    end,
  },
}
