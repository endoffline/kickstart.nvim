return {
  {
    'FabijanZulj/blame.nvim',
    event = 'VeryLazy',
    config = function()
      require('blame').setup {}

      local wk = require 'which-key'
      local icons = require 'which-key.icons'

      wk.add {
        { '<leader>g', group = '[G]it', icon = icons.get_icon 'git' },
        {
          '<leader>gb',
          '<cmd>BlameToggle<cr>',
          desc = '[G]it [B]lame',
        },
      }
    end,
  },
}
