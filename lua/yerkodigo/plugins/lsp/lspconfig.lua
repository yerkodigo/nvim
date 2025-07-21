return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
    "b0o/schemastore.nvim", -- JSON schemas
  },
  config = function()
    -- Import plugins
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)
        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
      end,
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Diagnostic symbols
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup({
      handlers = {
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["emmet_ls"] = function()
          lspconfig["emmet_ls"].setup({
            capabilities = capabilities,
            filetypes = { "html", "css", "scss", "sass", "less", "typescriptreact", "javascriptreact", "vue" },
            init_options = {
              html = {
                options = {
                  -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
                  ["bem.enabled"] = true,
                },
              },
            },
          })
        end,
        ["volar"] = function()
          lspconfig["volar"].setup({
            capabilities = capabilities,
            filetypes = { "vue", "typescript", "javascript" },
            init_options = {
              vue = {
                hybridMode = false,
              },
            },
          })
        end,
        ["tsserver"] = function()
          lspconfig["tsserver"].setup({
            capabilities = capabilities,
            filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
            init_options = {
              preferences = {
                disableSuggestions = true,
              },
            },
          })
        end,
        ["html"] = function()
          lspconfig["html"].setup({
            capabilities = capabilities,
            filetypes = { "html", "vue" },
          })
        end,
        ["cssls"] = function()
          lspconfig["cssls"].setup({
            capabilities = capabilities,
            filetypes = { "css", "scss", "sass", "less", "vue" },
            settings = {
              css = {
                validate = true,
                lint = {
                  unknownAtRules = "ignore",
                },
              },
              scss = {
                validate = true,
                lint = {
                  unknownAtRules = "ignore",
                },
              },
              less = {
                validate = true,
                lint = {
                  unknownAtRules = "ignore",
                },
              },
            },
          })
        end,
        ["jsonls"] = function()
          lspconfig["jsonls"].setup({
            capabilities = capabilities,
            filetypes = { "json", "jsonc" },
            settings = {
              json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
              },
            },
          })
        end,
        ["eslint"] = function()
          lspconfig["eslint"].setup({
            capabilities = capabilities,
            filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
            settings = {
              workingDirectory = { mode = "auto" },
            },
          })
        end,
        ["lua_ls"] = function()
          lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = { globals = { "vim" } },
                completion = { callSnippet = "Replace" },
              },
            },
          })
        end,
      },
    })
  end,
}
