return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    local notify = require("notify")
    notify.setup({
      stages = "fade",
      render = "default",
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
      -- background_colour = "#D3D3D3",
      top_down = false,
      on_open = function(win)
        local cfg  = vim.api.nvim_win_get_config(win)
        cfg.anchor = "SE"
        cfg.row    = vim.o.lines - 2
        cfg.col    = vim.o.columns - 2
        vim.api.nvim_win_set_config(win, cfg)
      end,
    })
    -- overwrite the built-in vim.notify
    vim.notify = notify

    -- custom notify highlights
    vim.cmd [[

      highlight NotifyERRORTitle  guifg=#F70067
      highlight NotifyERRORBorder guifg=#8A1F1F
      highlight NotifyERRORIcon guifg=#F70067
      highlight link NotifyERRORBody Normal

      highlight NotifyWARNIcon guifg=#F79000
      highlight NotifyWARNBorder guifg=#79491D
      highlight NotifyWARNTitle guifg=#F79000
      highlight link NotifyWARNBody Normal

      highlight NotifyTRACEIcon guifg=#D484FF
      highlight NotifyTRACEBorder guifg=#4F3552
      highlight NotifyTRACETitle  guifg=#D484FF
      highlight link NotifyTRACEBody Normal

      highlight NotifyINFOBorder guifg=#4F6752
      highlight NotifyINFOIcon guifg=#1A38A1
      highlight NotifyINFOTitle guifg=#1A38A1
      highlight link NotifyINFOBody Normal

      highlight NotifyDEBUGBorder guifg=#8B8B8B
      highlight NotifyDEBUGIcon guifg=#8B8B8B
      highlight NotifyDEBUGTitle  guifg=#8B8B8B
      highlight link NotifyDEBUGBody Normal

    ]]
  end,
}
