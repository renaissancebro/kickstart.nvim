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
      
      -- Theme-agnostic custom highlight function
      local function setup_custom_highlights()
        -- Fallback colors that work with any theme
        local colors = {
          orange = vim.g.colors_name == 'onedark' and '#e5c07b' or '#ff8800',
          cyan = vim.g.colors_name == 'onedark' and '#56b6c2' or '#00aaaa', 
          pink = vim.g.colors_name == 'onedark' and '#c678dd' or '#ff69b4',
          green = vim.g.colors_name == 'onedark' and '#98c379' or '#00aa00',
          purple = vim.g.colors_name == 'onedark' and '#c678dd' or '#aa00aa',
          yellow = vim.g.colors_name == 'onedark' and '#e5c07b' or '#ffaa00',
          blue = vim.g.colors_name == 'onedark' and '#61afef' or '#0088ff',
        }
        
        vim.api.nvim_set_hl(0, 'PythonFString', { fg = colors.orange, bold = true })
        vim.api.nvim_set_hl(0, 'JSTemplateLiteral', { fg = colors.orange, bold = true })
        vim.api.nvim_set_hl(0, 'CustomBrackets', { fg = colors.cyan })
        vim.api.nvim_set_hl(0, 'HTMLTag', { fg = colors.pink, bold = true })
        vim.api.nvim_set_hl(0, 'HTMLAttr', { fg = colors.green })
        vim.api.nvim_set_hl(0, 'CSSProperty', { fg = colors.purple })
        vim.api.nvim_set_hl(0, 'CSSSelector', { fg = colors.yellow, bold = true })
        vim.api.nvim_set_hl(0, 'Function', { fg = colors.blue, bold = true })
      end
      
      -- Apply highlights initially and after colorscheme changes
      setup_custom_highlights()
      vim.api.nvim_create_autocmd('ColorScheme', {
        callback = setup_custom_highlights,
      })
      
      -- Set default colorscheme (change this to switch themes)
      vim.cmd.colorscheme 'onedark' -- Options: catppuccin, tokyonight, onedark, kanagawa, nightfox
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
