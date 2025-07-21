---@enum Neominimap.Handler.Annotation
local AnnotationMode = {
  Sign = "sign", -- Show braille signs in the sign column
  Icon = "icon", -- Show icons in the sign column
  Line = "line", -- Highlight the background of the line on the minimap
}

vim.g.neominimap = {
  -- Enable the plugin by default
  auto_enable = true, ---@type boolean

  -- Log level
  log_level = vim.log.levels.OFF, ---@type Neominimap.Log.Levels

  -- Notification level
  notification_level = vim.log.levels.INFO, ---@type Neominimap.Log.Levels

  -- Path to the log file
  log_path = vim.fn.stdpath("data") .. "/neominimap.log", ---@type string

  -- Minimaps will not be created for buffers of these filetypes
  ---@type string[]
  exclude_filetypes = {
    "help",
    "bigfile", -- For Snacks.nvim
  },

  -- Minimaps will not be created for buffers of these buftypes
  ---@type string[]
  exclude_buftypes = {
    "nofile",
    "nowrite",
    "quickfix",
    "terminal",
    "prompt",
  },

  -- Cuando esta función retorna false, no se crea el minimap para ese buffer.
  ---@type fun(bufnr: integer): boolean
  buf_filter = function(bufnr)
    local buftype = vim.api.nvim_buf_get_option(bufnr, "buftype")
    local exclude = {
      ["nofile"] = true,
      ["nowrite"] = true,
      ["quickfix"] = true,
      ["terminal"] = true,
      ["prompt"] = true,
    }
    -- Solo crear el minimap si el buftype es vacío (buffer normal)
    return not exclude[buftype]
  end,

  -- Cuando esta función retorna false, no se crea el minimap en esa ventana.
  ---@type fun(winid: integer): boolean
  win_filter = function()
    return true
  end,

  -- Cuando esta función retorna false, no se crea el minimap en esa tab.
  ---@type fun(tabid: integer): boolean
  tab_filter = function()
    return true
  end,

  -- How many columns a dot should span
  x_multiplier = 4, ---@type integer

  -- How many rows a dot should span
  y_multiplier = 1, ---@type integer

  buffer = {
    -- Cuando es true, el minimap se recrea cuando borras el buffer.
    -- Cuando es false, se desactiva el minimap para el buffer actual cuando borras el buffer del minimap.
    persist = true, ---@type boolean
  },

  ---@alias Neominimap.Config.LayoutType "split" | "float"

  --- Either `split` or `float`
  layout = "split", ---@type Neominimap.Config.LayoutType

  split = {
    minimap_width = 20, ---@type integer
    fix_width = false, ---@type boolean
    direction = "right", ---@type Neominimap.Config.SplitDirection
    close_if_last_window = false, ---@type boolean
    persist = true, ---@type boolean
  },

  float = {
    minimap_width = 20, ---@type integer
    max_minimap_height = nil,
    margin = {
      right = 0, ---@type integer
      top = 0, ---@type integer
      bottom = 0, ---@type integer
    },
    z_index = 1, ---@type integer
    window_border = vim.fn.has("nvim-0.11") == 1 and vim.opt.winborder:get() or "single",
    persist = true, ---@type boolean
  },

  delay = 200, ---@type integer
  sync_cursor = true, ---@type boolean

  click = {
    enabled = false, ---@type boolean
    auto_switch_focus = true, ---@type boolean
  },

  diagnostic = {
    enabled = true, ---@type boolean
    use_event_diagnostics = false, ---@type boolean
    severity = nil, ---@type vim.diagnostic.SeverityFilter?
    mode = "line", ---@type Neominimap.Handler.Annotation.Mode
    priority = {
      ERROR = 100, ---@type integer
      WARN = 90, ---@type integer
      INFO = 80, ---@type integer
      HINT = 70, ---@type integer
    },
    icon = {
      ERROR = "󰅚 ", ---@type string
      WARN = "󰀪 ", ---@type string
      INFO = "󰌶 ", ---@type string
      HINT = " ", ---@type string
    },
  },

  git = {
    enabled = true, ---@type boolean
    mode = "sign", ---@type Neominimap.Handler.Annotation.Mode
    priority = 6, ---@type integer
    icon = {
      add = "+ ", ---@type string
      change = "~ ", ---@type string
      delete = "- ", ---@type string
    },
  },

  mini_diff = {
    enabled = false, ---@type boolean
    mode = "sign", ---@type Neominimap.Handler.Annotation.Mode
    priority = 6, ---@type integer
    icon = {
      add = "+ ", ---@type string
      change = "~ ", ---@type string
      delete = "- ", ---@type string
    },
  },

  search = {
    enabled = false, ---@type boolean
    mode = "line", ---@type Neominimap.Handler.Annotation.Mode
    priority = 20, ---@type integer
    icon = "󰱽 ", ---@type string
  },

  treesitter = {
    enabled = true, ---@type boolean
    priority = 200, ---@type integer
  },

  mark = {
    enabled = false, ---@type boolean
    mode = "icon", ---@type Neominimap.Handler.Annotation.Mode
    priority = 10, ---@type integer
    key = "m", ---@type string
    show_builtins = false, ---@type boolean
  },

  fold = {
    enabled = true, ---@type boolean
  },

  winopt = function(opt, winid) end,
  bufopt = function(opt, bufnr) end,
  handlers = {},
}
