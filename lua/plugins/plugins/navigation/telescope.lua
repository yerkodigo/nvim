-- sudo apt install ripgrep fd-find
return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
      "folke/todo-comments.nvim"
    },
    keys = {
      { "<leader>p", "<cmd>Telescope find_files<cr>", desc = "Fuzzy find files in cwd" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Fuzzy find recent files" },
      { "<leader>ag", "<cmd>Telescope live_grep<cr>", desc = "Find string in cwd" },
      { "<leader>fc", "<cmd>Telescope grep_string<cr>", desc = "Find string under cursor in cwd" },
      { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find TODOS" },
      { "<leader>gs", function() require("telescope.builtin").git_status() end, desc = "Git status" },
      { "<leader>gc", function() require("telescope.builtin").git_bcommits() end, desc = "Git commits (buffer)" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

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
        },
        pickers = {
          git_bcommits = {
            mappings = {
              i = {
                ["<CR>"] = function(prompt_bufnr)
                  local selection = require("telescope.actions.state").get_selected_entry()
                  local current_file = vim.fn.expand("%:p")
                  actions.close(prompt_bufnr)

                  -- Get the diff content
                  local diff = vim.fn.system("git show " .. selection.value .. " -- " .. current_file)

                  -- Open in new split with diff content (read-only)
                  vim.cmd("vsplit")
                  local buf = vim.api.nvim_create_buf(false, true)
                  vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(diff, "\n"))
                  vim.api.nvim_win_set_buf(0, buf)
                  vim.bo[buf].filetype = "diff"
                  vim.bo[buf].modifiable = false
                  vim.bo[buf].buftype = "nofile"
                end,
              },
              n = {
                ["<CR>"] = function(prompt_bufnr)
                  local selection = require("telescope.actions.state").get_selected_entry()
                  local current_file = vim.fn.expand("%:p")
                  actions.close(prompt_bufnr)

                  -- Get the diff content
                  local diff = vim.fn.system("git show " .. selection.value .. " -- " .. current_file)

                  -- Open in new split with diff content (read-only)
                  vim.cmd("vsplit")
                  local buf = vim.api.nvim_create_buf(false, true)
                  vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(diff, "\n"))
                  vim.api.nvim_win_set_buf(0, buf)
                  vim.bo[buf].filetype = "diff"
                  vim.bo[buf].modifiable = false
                  vim.bo[buf].buftype = "nofile"
                end,
              }
            }
          }
        }
      })

      telescope.load_extension("fzf")
    end,
  },
}
