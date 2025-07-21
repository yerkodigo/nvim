local prettier = require("prettier")

prettier.setup({
  bin = 'prettier',
  filetypes = {
    "javascript",
    "typescript",
    "css",
    "json",
    "markdown",
    "html",
    "yaml",
    "vue",
  },
})

-- Autocomando para formatear al guardar
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {
    "*.js",
    "*.ts",
    "*.jsx",
    "*.tsx",
    "*.css",
    "*.json",
    "*.md",
    "*.vue",
  },
  callback = function()
    vim.cmd("Prettier")
  end,
})

