return {
  "tomasky/bookmarks.nvim",
  event = "VeryLazy",

  config = function()
    require('bookmarks').setup({
      save_file = vim.fn.expand("$HOME/.bookmarks"),
      keywords = {
        ["@t"] = "☑️ ",
        ["@w"] = "⚠️ ",
        ["@f"] = "⛏ ",
        ["@n"] = "📝 ",
      },
    })

    -- Configurar keymaps FUERA del on_attach
    local bm = require "bookmarks"
    local map = vim.keymap.set

    -- Keymaps principales
    map("n", "mm", bm.bookmark_toggle, { desc = "Toggle bookmark" })
    map("n", "mi", bm.bookmark_ann, { desc = "Add/Edit bookmark annotation" })
    map("n", "mc", bm.bookmark_clean, { desc = "Clean bookmarks in buffer" })
    map("n", "mn", bm.bookmark_next, { desc = "Next bookmark" })
    map("n", "mp", bm.bookmark_prev, { desc = "Previous bookmark" })
    map("n", "ml", bm.bookmark_list, { desc = "List bookmarks" })
    map("n", "mx", bm.bookmark_clear_all, { desc = "Clear all bookmarks" })

    -- Integración con Telescope (opcional)
    local has_telescope = pcall(require, "telescope")
    if has_telescope then
      pcall(function()
        require("telescope").load_extension("bookmarks")
        map("n", "ma", "<cmd>Telescope bookmarks list<CR>",
          { desc = "Search bookmarks with Telescope" })
      end)
    end
  end,
}
