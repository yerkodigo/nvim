return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- configure nvim-treesitter
    require("nvim-treesitter.configs").setup({
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "json", "javascript", "typescript", "tsx", "yaml", "html", "css",
        "prisma", "markdown", "markdown_inline", "svelte", "graphql", "bash",
        "lua", "vim", "dockerfile", "gitignore", "query", "vimdoc", "c", "vue",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })

    -- configure nvim-ts-autotag separately
    require('nvim-ts-autotag').setup({
      enable = true,
      enable_close = true,
      enable_rename = true,
      enable_close_on_slash = false,
      per_filetype = {
        ["html"] = {
          enable_close = true
        }
      }
    })
  end,
}
