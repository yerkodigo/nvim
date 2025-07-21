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
