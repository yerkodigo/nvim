return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    local notify = require("notify")
    notify.setup({
      stages = "fade",
      render = "compact",
      timeout = 3000,
      max_width = function() return math.floor(vim.o.columns * 0.75) end,
      max_height = function() return math.floor(vim.o.lines * 0.75) end,
      icons = {
        ERROR = "",
        WARN  = "",
        INFO  = "",
        DEBUG = "",
        TRACE = "✎",
      },
      background_colour = "#000000",
    })
    -- overwrite the built-in vim.notify
    vim.notify = notify
  end,
}
