local M = {}

function M.setup()
  require("gitsigns").setup({
    signs = {
      add          = { text = "+" },
      change       = { text = "~" },
      delete       = { text = "-" },
      topdelete    = { text = "‾" },
      changedelete = { text = "~-" },
    },
    update_debounce = 100,
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
  })

  vim.api.nvim_create_autocmd("BufWritePost", {
    callback = function()
      vim.cmd("Gitsigns refresh")
    end,
  })

  vim.api.nvim_create_autocmd("FocusGained", {
    callback = function()
      vim.cmd("Gitsigns refresh")
    end,
  })
end

return M
