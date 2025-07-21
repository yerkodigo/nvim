return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "onsails/lspkind-nvim",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("config.completion")
    end,
  },
}

