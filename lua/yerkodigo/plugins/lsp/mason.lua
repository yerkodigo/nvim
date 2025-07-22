return {
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "stylua",    -- formateador Lua
        "shfmt",     -- formateador shell
        -- Agrega aquí otros linters, formatters o servidores LSP que quieras instalar con mason
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          vim.cmd("MasonUpdate") -- Actualiza Mason cuando se instala un paquete
        end, 100)
      end)
    end,
  },
}
