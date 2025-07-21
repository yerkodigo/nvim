return {
  {
    "MunifTanjim/prettier.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "jose-elias-alvarez/null-ls.nvim"
    },
    config = function()
      require("config.prettier")
    end,
  },
}

