return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "jaredgorski/Mies.vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = "light"
      vim.cmd("colorscheme mies")

      -- Fondo transparente para la terminal
      vim.cmd([[
      highlight Normal guibg=none
      highlight NormalNC guibg=none
      highlight NormalFloat guibg=none
      highlight VertSplit guibg=none
      highlight SignColumn guibg=none
      highlight StatusLine guibg=none
      highlight TabLine guibg=none
      highlight LineNr guibg=none
      ]])
    end,
  }

}

