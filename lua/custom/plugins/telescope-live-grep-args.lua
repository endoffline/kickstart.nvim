-- Useful for providing arguments to live grep using globs or file types.
return {
  {
    'nvim-telescope/telescope-live-grep-args.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup {
        extensions = {
          live_grep_args = {
            auto_quoting = true,
            vimgrep_arguments = {
              'rg',
              '--color=never',
              '--no-heading',
              '--with-filename',
              '--line-number',
              '--column',
              '--smart-case',
              '--hidden',

              '--glob=!**/.git/*',
              '--glob=!**/.idea/*',
              '--glob=!**/.vscode/*',
              '--glob=!**/build/*',
              '--glob=!**/dist/*',
              '--glob=!**/node_modules/*',
              '--glob=!**/yarn.lock',
              '--glob=!**/package-lock.json',
            },
          },
        },
      }

      require('telescope').load_extension 'live_grep_args'

      -- Keybinding to open the file browser
      require('which-key').add { { '<leader>sg', '<cmd>Telescope live_grep_args<cr>', desc = '[S]earch by Live [G]rep' } }
    end,
  },
}
