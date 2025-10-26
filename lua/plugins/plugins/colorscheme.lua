return {
  {
    -- DEV
    -- "yka-tron-local",
    -- dir = vim.fn.expand("~/.config/yka.tron"),
    -- dev = true,

    -- REPO
    "yerkodigo/yka.tron",
    name = "yka-tron",
    branch = 'main',

    lazy = false,
    priority = 1000,
    opts = {
      background = "dark",
      transparent = false,
    },
    config = function(_, opts)
      local vi = vim
      local colorscheme_name = "tron"

      vi.opt.termguicolors = true
      vi.opt.background = opts.background or "light"

      vi.cmd('colorscheme ' .. colorscheme_name)

      local function set_colorscheme(style)
        vi.opt.background = style
        vi.cmd('colorscheme ' .. colorscheme_name)
      end

      vi.keymap.set('n', '<leader>dt', function() set_colorscheme('dark') end,
        { desc = colorscheme_name:gsub("^%l", string.upper) .. ' Dark' })
      vi.keymap.set('n', '<leader>lt', function() set_colorscheme('light') end,
        { desc = colorscheme_name:gsub("^%l", string.upper) .. ' Light' })
    end,
}
