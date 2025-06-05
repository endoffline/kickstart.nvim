return {
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    config = function()
      local telescope = require 'telescope'
      telescope.setup {
        extensions = {
          file_browser = {
            hijack_netrw = true, -- This will make the file browser take over netrw
            path = vim.fn.expand '%:p:h',
            select_buffer = true,
            hidden = true,
          },
        },
      }
      telescope.load_extension 'file_browser'

      -- Keybinding to open the file browser with the path of the current buffer
      require('which-key').add {
        {
          '<leader>b',
          function()
            telescope.extensions.file_browser.file_browser {
              path = vim.fn.expand '%:p:h',
              select_buffer = true,
            }
          end,
          desc = 'File [B]rowser',
          silent = true,
          noremap = true,
        },
      }
    end,
  },
}
