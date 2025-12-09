return {
  "karb94/neoscroll.nvim",
  event = "VeryLazy",
  config = function()
    require("neoscroll").setup({
      easing_function = "quadratic",
      hide_cursor = true,
      stop_eof = true,
      mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" }
    })
  end,
}
