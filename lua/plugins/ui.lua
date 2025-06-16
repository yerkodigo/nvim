return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
      indent = {
        char = "¦"
      }
    },
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

      vim.opt.cursorline = true
      vim.opt.cursorcolumn = true

      vim.cmd([[
      highlight CursorLine ctermbg=254 guibg=#e0e0e0
      highlight CursorColumn ctermbg=254 guibg=#e0e0e0
      ]])
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- Iconos opcionales
    },
    config = function()
      require("config.lualine")
    end,
    event = "VeryLazy", -- o "BufEnter" si querés que cargue al abrir archivos
  },
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   dependencies = { "nvim-tree/nvim-web-devicons" }, -- para iconos opcionales
  --   config = function()
  --     require("lualine").setup({
  --       options = {
  --         theme = "onelight", -- respeta los colores del colorscheme actual
  --         section_separators = "",
  --         component_separators = "",
  --         globalstatus = true, -- barra única en lugar de una por ventana
  --       },
  --       sections = {
  --         lualine_a = {'mode'},
  --         lualine_b = {'branch', 'diff', 'diagnostics'},
  --         lualine_c = {'filename'},
  --         lualine_x = {'encoding', 'fileformat', 'filetype'},
  --         lualine_y = {'progress'},
  --         lualine_z = {'location'}
  --       },
  --       inactive_sections = {
  --         lualine_a = {},
  --         lualine_b = {},
  --         lualine_c = { "filename" },
  --         lualine_x = { "location" },
  --         lualine_y = {},
  --         lualine_z = {},
  --       },
  --       tabline = {},
  --       extensions = {},
  --     })
  --   end,
  -- },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({
        easing_function = "quadratic",
        hide_cursor = true,
        stop_eof = true,
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" }
      })
    end,
  }
}
