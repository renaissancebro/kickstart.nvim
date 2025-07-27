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
        ensure_installed = { 
          'python', 'lua', 'vim', 'vimdoc', 'query',
          'html', 'css', 'javascript', 'typescript', 'tsx', 'jsx'
        },
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      }
      
      -- Custom highlight groups
      vim.api.nvim_set_hl(0, 'PythonFString', { fg = '#fab387', bold = true }) -- Orange f-strings
      vim.api.nvim_set_hl(0, 'JSTemplateLiteral', { fg = '#fab387', bold = true }) -- Orange template literals
      vim.api.nvim_set_hl(0, 'CustomBrackets', { fg = '#89dceb' }) -- Cyan brackets
      vim.api.nvim_set_hl(0, 'HTMLTag', { fg = '#f38ba8', bold = true }) -- Pink HTML tags
      vim.api.nvim_set_hl(0, 'HTMLAttr', { fg = '#a6e3a1' }) -- Green HTML attributes
      vim.api.nvim_set_hl(0, 'CSSProperty', { fg = '#cba6f7' }) -- Purple CSS properties
      vim.api.nvim_set_hl(0, 'CSSSelector', { fg = '#f9e2af', bold = true }) -- Yellow CSS selectors
      
      -- Apply custom highlights after colorscheme loads
      vim.api.nvim_create_autocmd('ColorScheme', {
        callback = function()
          vim.api.nvim_set_hl(0, 'PythonFString', { fg = '#fab387', bold = true })
          vim.api.nvim_set_hl(0, 'JSTemplateLiteral', { fg = '#fab387', bold = true })
          vim.api.nvim_set_hl(0, 'CustomBrackets', { fg = '#89dceb' })
          vim.api.nvim_set_hl(0, 'HTMLTag', { fg = '#f38ba8', bold = true })
          vim.api.nvim_set_hl(0, 'HTMLAttr', { fg = '#a6e3a1' })
          vim.api.nvim_set_hl(0, 'CSSProperty', { fg = '#cba6f7' })
          vim.api.nvim_set_hl(0, 'CSSSelector', { fg = '#f9e2af', bold = true })
        end,
      })
    end,
  },
  
  -- Multiple theme support
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        flavour = 'mocha',
        custom_highlights = function(colors)
          return {
            PythonFString = { fg = colors.peach, style = { 'bold' } },
            JSTemplateLiteral = { fg = colors.peach, style = { 'bold' } },
            CustomBrackets = { fg = colors.sky },
            HTMLTag = { fg = colors.pink, style = { 'bold' } },
            HTMLAttr = { fg = colors.green },
            CSSProperty = { fg = colors.mauve },
            CSSSelector = { fg = colors.yellow, style = { 'bold' } },
          }
        end,
        integrations = { treesitter = true },
      })
    end,
  },
  
  -- Additional popular themes
  { 'folke/tokyonight.nvim', priority = 1000 },
  { 'navarasu/onedark.nvim', priority = 1000 },
  { 'rebelot/kanagawa.nvim', priority = 1000 },
  { 'EdenEast/nightfox.nvim', priority = 1000 },
  
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
          -- JavaScript template literals
          template_literal = {
            pattern = "`.-`",
            group = 'JSTemplateLiteral',
          },
          -- Enhanced bracket highlighting
          brackets = {
            pattern = '[()%[%]{}]',
            group = 'CustomBrackets',
          },
          -- HTML tags
          html_tags = {
            pattern = "</?%w+[^>]*>",
            group = 'HTMLTag',
          },
          -- CSS selectors (basic)
          css_selectors = {
            pattern = "%.%w+",
            group = 'CSSSelector',
          },
        },
      })
    end,
  },
}
