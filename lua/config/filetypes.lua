-- detección de componentes .vue
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
  pattern = '*.vue',
  callback = function()
    vim.bo.filetype = 'vue'
  end
})
