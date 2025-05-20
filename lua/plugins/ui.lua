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
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- para iconos opcionales
    config = function()
      require("lualine").setup({
        options = {
          theme = "onelight", -- respeta los colores del colorscheme actual
          section_separators = "",
          component_separators = "",
          globalstatus = true, -- barra única en lugar de una por ventana
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      })
    end,
  }
}
