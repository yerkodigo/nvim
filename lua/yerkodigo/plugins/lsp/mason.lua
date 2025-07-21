return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "html",
        "cssls",
        "emmet_ls",
        -- "tsserver", Intalar manualmente typescript: 
        -- npm install -g typescript typescript-language-server
        -- npm install -g @vue/language-server
        "lua_ls",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",   -- formatter
        "eslint_d",   -- fast eslint
        -- Agrega otras herramientas que prefieras aquí
      },
    })
  end,
}
