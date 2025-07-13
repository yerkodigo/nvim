local M = {}

local function set_dark_theme()
  vim.opt.background = "dark"
  vim.cmd([[
  highlight CursorLine ctermbg=254 guibg=#212121
  highlight CursorColumn ctermbg=254 guibg=#212121
  ]])
end

local function set_light_theme()
  vim.opt.background = "light"
  vim.cmd([[
  highlight CursorLine ctermbg=254 guibg=#e0e0e0
  highlight CursorColumn ctermbg=254 guibg=#e0e0e0
  ]])
end

function M.setup()
  vim.opt.background = "dark"
  vim.cmd("colorscheme mies")

  -- Fondo transparente para la terminal
  -- vim.cmd([[
  -- highlight Normal guibg=none
  -- highlight NormalNC guibg=none
  -- highlight NormalFloat guibg=none
  -- highlight VertSplit guibg=none
  -- highlight SignColumn guibg=none
  -- highlight StatusLine guibg=none
  -- highlight TabLine guibg=none
  -- highlight LineNr guibg=none
  -- ]])

  vim.opt.cursorline = true
  vim.opt.cursorcolumn = true

  set_light_theme()

  vim.api.nvim_set_keymap('n', '<leader>dt', ':lua require("config.theme").set_dark_theme()<CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', '<leader>lt', ':lua require("config.theme").set_light_theme()<CR>', { noremap = true, silent = true })

end

M.set_dark_theme = set_dark_theme
M.set_light_theme = set_light_theme

return M
