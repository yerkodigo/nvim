local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup({
  settings = {
    save_on_toggle = false,
    sync_on_ui_close = false,
  }
})

-- Configure custom keybindings for the harpoon menu
harpoon:extend({
  UI_CREATE = function(cx)
    -- Set up keybindings for the harpoon menu buffer
    vim.keymap.set("n", "dd", function()
      -- Get the current cursor line (1-indexed)
      local line = vim.fn.line('.')
      -- Remove the item at the current line
      harpoon:list():remove_at(line)
      -- Refresh the menu by closing and reopening it
      vim.api.nvim_win_close(0, true)
      vim.defer_fn(function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, 50)
    end, { buffer = cx.bufnr, desc = "Delete item from harpoon list" })
  end,
})
-- REQUIRED

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers").new({}, {
    prompt_title = "Harpoon",
    finder = require("telescope.finders").new_table({
      results = file_paths,
    }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
  }):find()
end

vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon - Agrega archivo a la lista"})
vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon - Agrega archivo a la lista"})
vim.keymap.set("n", "<leader>hd", function() harpoon:list():remove() end, { desc = "Harpoon - Elimina archivo a la lista"})

-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
