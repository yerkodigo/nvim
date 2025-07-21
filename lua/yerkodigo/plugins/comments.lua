return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- enable comment
    comment.setup({
      -- for commenting tsx, jsx, svelte, html files
      pre_hook = ts_context_commentstring.create_pre_hook(),
    })

    -- COMENTARIOS
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Comentar línea actual
    map("n", "<Leader>c<Leader>", "gcc", { noremap = false, silent = true })
    -- Comentar selección
    map("v", "<Leader>c<Leader>", "gc", { noremap = false, silent = true })
  end,
}
