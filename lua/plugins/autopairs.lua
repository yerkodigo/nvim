return {
  {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup {
        filetypes = {
          "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue"
        },
      }
    end,
  },
}

