return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("config.git").setup()
    end,
  },
}
