return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        event_handlers = {
          {
            event = "file_opened",
            handler = function(file_path)
              -- Cierra Neo-tree cuando se abre un archivo
              require("neo-tree.command").execute({ action = "close" })
            end,
          },
        },
      })
    end,
  },
}
