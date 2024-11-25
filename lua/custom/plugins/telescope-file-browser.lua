return {
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    init = function()
      require('telescope').load_extension 'file_browser'

      -- Keybinding to open the file browser
      require('which-key').add { { '<leader>fb', '<cmd>Telescope file_browser<cr>', desc = 'File Browser', silent = true, noremap = true } }

      -- Disable netrw
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
  },
}
