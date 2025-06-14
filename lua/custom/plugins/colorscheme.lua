return {
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('cyberdream').setup {
        -- transparent = true,  -- optional: make background transparent
      }
      vim.cmd.colorscheme 'cyberdream'
    end,
  },
}
