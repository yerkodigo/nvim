local platform = require("util.platform")

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        -- Build condicional según plataforma
        build = platform.is_windows
          and "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release"
          or "make",
        cond = function()
          return platform.executable("make") or platform.executable("cmake")
        end,
      },
      "nvim-tree/nvim-web-devicons",
      "folke/todo-comments.nvim"
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      vim.keymap.set('n', '<leader>gs', require("telescope.builtin").git_status)
      vim.keymap.set('n', '<leader>gd', ":Gitsigns diffthis<CR>")

      telescope.setup({

        defaults = {
          path_display = { "relative" },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            }
          }
        }

      })

      -- Cargar extension FZF solo si está disponible
      pcall(function()
        telescope.load_extension("fzf")
      end)

      -- keymaps
      local keymap = vim.keymap

      keymap.set("n", "<leader>p", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
      keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
      keymap.set("n", "<leader>ag", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
      keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
      keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find TODOS" })
    end,
  },
}
