-- Enhanced syntax highlighting plugin
return {
  -- Better f-string and bracket highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Make sure we have the parsers we need
      if not opts.ensure_installed then
        opts.ensure_installed = {}
      end
      vim.list_extend(opts.ensure_installed, {
        "python",
        "javascript", 
        "typescript",
        "html",
        "css"
      })
      return opts
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      
      -- Custom highlight setup
      local function setup_custom_highlights()
        -- Python f-string highlighting
        vim.api.nvim_set_hl(0, "@string.special.python", { fg = "#e0af68", bold = true })
        vim.api.nvim_set_hl(0, "@punctuation.special.python", { fg = "#e0af68", bold = true })
        
        -- General punctuation
        vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#7dcfff" })
        vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "#e0af68" })
        
        -- Function calls
        vim.api.nvim_set_hl(0, "@function.call", { fg = "#7aa2f7" })
        vim.api.nvim_set_hl(0, "@function.builtin", { fg = "#7dcfff" })
        
        -- Variables
        vim.api.nvim_set_hl(0, "@variable.builtin", { fg = "#f7768e" })
        vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "#ff9e64" })
        
        -- Python-specific enhancements
        vim.api.nvim_set_hl(0, "@function.decorator", { fg = "#e0af68", bold = true })
        vim.api.nvim_set_hl(0, "@keyword.async", { fg = "#bb9af7", bold = true })
        vim.api.nvim_set_hl(0, "@keyword.import", { fg = "#bb9af7", bold = true })
        vim.api.nvim_set_hl(0, "@module", { fg = "#7dcfff" })
        vim.api.nvim_set_hl(0, "@type.class", { fg = "#7dcfff", bold = true })
        vim.api.nvim_set_hl(0, "@function.method", { fg = "#7aa2f7" })
        
        -- Template literals (JS/TS)
        vim.api.nvim_set_hl(0, "@punctuation.special.template", { fg = "#e0af68", bold = true })
        
        -- HTML
        vim.api.nvim_set_hl(0, "@tag", { fg = "#f7768e", bold = true })
        vim.api.nvim_set_hl(0, "@tag.attribute", { fg = "#e0af68" })
        vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = "#7dcfff" })
      end
      
      -- Apply highlights when treesitter is loaded
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.schedule(setup_custom_highlights)
        end
      })
      
      -- Reapply on colorscheme change
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = setup_custom_highlights
      })
      
      -- Apply immediately
      setup_custom_highlights()
    end,
  },
  
  -- Alternative f-string plugin for Python
  {
    "roobert/f-string-toggle.nvim",
    ft = "python",
    config = function()
      require("f-string-toggle").setup({
        -- Highlight f-string expressions
        key_binding = "<leader>f",
        key_binding_desc = "Toggle f-string",
      })
      
      -- Custom f-string highlighting
      vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
        pattern = "*.py",
        callback = function()
          -- Enhanced f-string regex matching
          vim.cmd([[
            syntax match pythonFStringBrace /{\|}/
            highlight link pythonFStringBrace Special
            
            syntax match pythonFStringPrefix /f['"]/
            highlight link pythonFStringPrefix Keyword
          ]])
        end,
      })
    end,
  },
}