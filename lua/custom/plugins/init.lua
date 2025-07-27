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
      
      -- Colors are now handled in colorscheme.lua
      -- Tree-sitter highlighting will use the custom highlight groups defined there
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
