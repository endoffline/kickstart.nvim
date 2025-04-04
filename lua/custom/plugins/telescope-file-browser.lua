return {
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').load_extension 'file_browser'

      -- Keybinding to open the file browser with the path of the current buffer
      require('which-key').add {
        {
          '<leader>b',
          function()
            require('telescope').extensions.file_browser.file_browser { path = vim.fn.expand '%:p:h', select_buffer = true, hidden = true }
          end,
          desc = 'File [B]rowser',
          silent = true,
          noremap = true,
        },
      }

      -- Disable netrw
      -- vim.g.loaded_netrw = 1

      -- vim.g.loaded_netrwPlugin = 1
    end,
  },
}
