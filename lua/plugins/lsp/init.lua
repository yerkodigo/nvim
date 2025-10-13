return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
      "mason.nvim",
      { "mason-org/mason-lspconfig.nvim", config = function() end },
      "b0o/schemastore.nvim",
    },
    opts = function()
      return {
        -- options for vim.diagnostic.config()
        diagnostics = {
          underline = true,
          update_in_insert = false,
          virtual_text = {
            spacing = 4,
            source = "if_many",
            prefix = "●",
          },
          severity_sort = true,
          signs = {
            text = {
              [vim.diagnostic.severity.ERROR] = " ",
              [vim.diagnostic.severity.WARN] = " ",
              [vim.diagnostic.severity.HINT] = " ",
              [vim.diagnostic.severity.INFO] = " ",
            },
          },
        },
        -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
        inlay_hints = {
          enabled = true,
          exclude = { "vue" },
        },
        -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
        codelens = {
          enabled = false,
        },
        -- add any global capabilities here
        capabilities = {
          workspace = {
            fileOperations = {
              didRename = true,
              willRename = true,
            },
          },
        },
        -- options for vim.lsp.buf.format
        format = {
          formatting_options = nil,
          timeout_ms = nil,
        },
        -- LSP Server Settings
        servers = {
          lua_ls = {
            settings = {
              Lua = {
                workspace = {
                  checkThirdParty = false,
                },
                codeLens = {
                  enable = true,
                },
                completion = {
                  callSnippet = "Replace",
                },
                doc = {
                  privateName = { "^_" },
                },
                hint = {
                  enable = true,
                  setType = false,
                  paramType = true,
                  paramName = "Disable",
                  semicolon = "Disable",
                  arrayIndex = "Disable",
                },
              },
            },
          },
          -- Volar para Vue.js 3 (recomendado sobre vue_ls/vetur)
          volar = {
            filetypes = { "vue" },
            init_options = {
              vue = {
                hybridMode = false,
              },
            },
          },
          -- TypeScript/JavaScript Language Server
          ts_ls = {
            -- Excluir archivos .vue de ts_ls para evitar conflictos con Volar
            filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
            init_options = {
              preferences = {
                importModuleSpecifierPreference = "non-relative",
                includePackageJsonAutoImports = "auto",
              },
            },
          },
          -- HTML Language Server
          html = {
            filetypes = { "html", "vue" },
          },
          -- CSS Language Server
          cssls = {
            filetypes = { "css", "scss", "less", "vue" },
          },
          -- ESLint Language Server
          eslint = {
            settings = {
              workingDirectories = { mode = "auto" },
            },
            on_attach = function(client, bufnr)
              -- Habilitar formato con ESLint si está disponible
              client.server_capabilities.documentFormattingProvider = true
            end,
          },
          -- JSON Language Server
          jsonls = {
            settings = {
              json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
              },
            },
          },
        },
        setup = {},
      }
    end,
    config = function(_, opts)
      local Util = require("util.lsp")

      -- setup keymaps
      Util.on_attach(function(client, buffer)
        local map = vim.keymap.set

        map("n", "gd", vim.lsp.buf.definition, { buffer = buffer, desc = "Goto Definition" })
        map("n", "gr", vim.lsp.buf.references, { buffer = buffer, desc = "References" })
        map("n", "gI", vim.lsp.buf.implementation, { buffer = buffer, desc = "Goto Implementation" })
        map("n", "gy", vim.lsp.buf.type_definition, { buffer = buffer, desc = "Goto T[y]pe Definition" })
        map("n", "gD", vim.lsp.buf.declaration, { buffer = buffer, desc = "Goto Declaration" })
        map("n", "K", vim.lsp.buf.hover, { buffer = buffer, desc = "Hover" })
        map("n", "gK", vim.lsp.buf.signature_help, { buffer = buffer, desc = "Signature Help" })
        map("i", "<c-k>", vim.lsp.buf.signature_help, { buffer = buffer, desc = "Signature Help" })
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = buffer, desc = "Code Action" })
        map({ "n", "v" }, "<leader>cc", vim.lsp.codelens.run, { buffer = buffer, desc = "Run Codelens" })
        map("n", "<leader>cC", vim.lsp.codelens.refresh, { buffer = buffer, desc = "Refresh & Display Codelens" })
        map("n", "<leader>rn", vim.lsp.buf.rename, { buffer = buffer, desc = "Rename" })
      end)

      Util.setup()

      -- Configure diagnostics
      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      local servers = opts.servers
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {},
        opts.capabilities or {}
      )

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})
        if server_opts.enabled == false then
          return
        end

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end
        require("lspconfig")[server].setup(server_opts)
      end

      -- get all the servers that are available through mason-lspconfig
      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      local all_mslp_servers = {}
      if have_mason then
        -- Manejo seguro del módulo mappings
        local ok, mappings = pcall(require, "mason-lspconfig.mappings.server")
        if ok and mappings.lspconfig_to_package then
          all_mslp_servers = vim.tbl_keys(mappings.lspconfig_to_package)
        end
      end

      local ensure_installed = {}
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          if server_opts.enabled ~= false then
            -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
            if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
              setup(server)
            else
              ensure_installed[#ensure_installed + 1] = server
            end
          end
        end
      end

      if have_mason then
        mlsp.setup({
          ensure_installed = ensure_installed,
          handlers = { setup },
        })
      end
    end,
  },
}
