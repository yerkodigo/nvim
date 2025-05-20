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
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({
        easing_function = "quadratic",
        hide_cursor = true,
        stop_eof = true,
      })

      local neoscroll = require("neoscroll")
      local config = require("neoscroll.config")

      local t = {}

      t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
      t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }
      t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "300" } }
      t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "300" } }
      t["zt"]    = { "zt", { "250" } }
      t["zz"]    = { "zz", { "250" } }
      t["zb"]    = { "zb", { "250" } }

      config.set_mappings(t)
    end,
  }
}
