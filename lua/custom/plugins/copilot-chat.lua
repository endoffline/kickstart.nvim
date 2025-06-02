return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'main',
    dependencies = {
      { 'zbirenbaum/copilot.lua' }, -- or zbirenbaum/copilot.lua
      { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log wrapper
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    event = 'VeryLazy',
    config = function()
      require('CopilotChat').setup {
        model = 'claude-3.7-sonnet',
      }

      local wk = require 'which-key'

      wk.add {
        { '<leader>gc', group = '[G]itHub Copilot [C]hat' },
        {
          '<leader>gcq',
          function()
            local input = vim.fn.input 'Quick Chat: '
            if input ~= '' then
              require('CopilotChat').ask(input, { selection = require('CopilotChat.select').buffer })
            end
          end,
          desc = '[G]itHub Copilot[C]hat - [Q]uick chat',
        },
        {
          '<leader>gco',
          '<cmd>CopilotChatOpen<cr>',
          desc = '[G]itHub Copilot[C]hat - [O]pen',
        },
        {
          '<leader>gcc',
          '<cmd>CopilotChatClose<cr>',
          desc = '[G]itHub Copilot[C]hat - [C]lose',
        },
      }
    end,
    -- See Commands section for default commands if you want to lazy load on them
  },
}
