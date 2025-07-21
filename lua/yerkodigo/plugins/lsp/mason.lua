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
        "tsserver",     -- TypeScript/JavaScript language server
        "volar",        -- Vue 3 language server with TypeScript support
        "jsonls",       -- JSON language server
        "eslint",       -- ESLint language server
        "lua_ls",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",     -- formatter for JS, TS, Vue, HTML, CSS, JSON
        "eslint_d",     -- fast eslint daemon
        "vue-language-server", -- Vue language server
        "typescript-language-server", -- TypeScript language server
        "vscode-langservers-extracted", -- HTML, CSS, JSON, ESLint language servers
        "stylelint",    -- CSS linter
        "js-debug-adapter", -- JavaScript debugger
      },
    })
  end,
}
