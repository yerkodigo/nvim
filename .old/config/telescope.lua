-- require('telescope').load_extension('git_status')

local telescope = require("telescope.builtin")
vim.keymap.set('n', '<leader>gs', telescope.git_status)
vim.keymap.set('n', '<leader>gd', ":Gitsigns diffthis<CR>")
