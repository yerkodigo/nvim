return {
  {
    "brenoprata10/nvim-highlight-colors",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "css", "scss", "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "lua" },
    config = function()
      require("nvim-highlight-colors").setup({
        render = "background",
        enable_named_colors = true,
        enable_tailwind = false,
      })
    end,
  },
}
