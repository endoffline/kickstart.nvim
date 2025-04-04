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
    opts = function()
      -- require('CopilotChat').setup {
      --   model = 'claude-3.5-sonnet',
      -- }
      require('which-key').add {
        { '<leader>cc', group = '[C]opilot [C]hat' },
        {
          '<leader>ccq',
          function()
            local input = vim.fn.input 'Quick Chat: '
            if input ~= '' then
              require('CopilotChat').ask(input, { selection = require('CopilotChat.select').buffer })
            end
          end,
          desc = '[C]opilot[C]hat - [Q]uick chat',
        },
        {
          '<leader>cco',
          '<cmd>CopilotChatOpen<cr>',
          desc = '[C]opilot[C]hat - [O]pen',
        },
        {
          '<leader>ccc',
          '<cmd>CopilotChatClose<cr>',
          desc = '[C]opilot[C]hat - [C]lose',
        },
      }
    end,
    -- See Commands section for default commands if you want to lazy load on them
  },
}
