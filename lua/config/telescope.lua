-- require('telescope').load_extension('git_status')

vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status)
