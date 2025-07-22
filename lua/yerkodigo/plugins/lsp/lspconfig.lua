return {
  -- Plugin principal
  {
    "neovim/nvim-lspconfig",
    -- event = "LazyFile",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "mason.nvim" },
      { "mason-org/mason-lspconfig.nvim", config = function() end },
    },
    opts = function()
      local ret = {
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
              [vim.diagnostic.severity.ERROR] = "",
              [vim.diagnostic.severity.WARN]  = "",
              [vim.diagnostic.severity.HINT]  = "",
              [vim.diagnostic.severity.INFO]  = "",
            },
          },
        },
        -- Inlay hints y code lens para Neovim >= 0.10.0
        inlay_hints = {
          enabled = true,
          exclude = { "vue" },
        },
        codelens = {
          enabled = false,
        },
        capabilities = {},
        workspace = {
          fileOperations = {
            didRename = true,
            willRename = true,
          },
        },
        format = {
          formatting_options = nil,
          timeout_ms = nil,
        },
        -- Aquí puedes añadir y configurar los servidores LSP
        servers = {
          lua_ls = {
            settings = {
              Lua = {
                workspace = { checkThirdParty = false },
                codeLens = { enable = true },
                completion = { callSnippet = "Replace" },
                doc = { privateName = { "^_" } },
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
          -- Agrega aquí otros servidores LSP que necesites (ejemplo: tsserver, pyright, etc.)
        },
        setup = {
          -- Aquí puedes personalizar la configuración de cada servidor LSP si lo necesitas.
          -- ["tsserver"] = function(_, opts) ... end,
        },
      }
      return ret
    end,
    config = function(_, opts)
      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
      -- Setup para cada servidor LSP
      local servers = opts.servers
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        opts.capabilities or {}
      )
      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", { capabilities = vim.deepcopy(capabilities) }, servers[server] or {})
        if server_opts.enabled == false then return end
        if opts.setup[server] and opts.setup[server](server, server_opts) then return end
        require("lspconfig")[server].setup(server_opts)
      end
      -- Si tienes mason-lspconfig, instala y configura los servidores automáticamente
      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      
      -- local all_mslp_servers = have_mason and vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package) or {}
      local all_mslp_servers = require("mason-lspconfig").get_available_servers()
      
      local ensure_installed = {}
      for server, server_opts in pairs(servers) do
        if server_opts and server_opts.enabled ~= false then
          if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
            setup(server)
          else
            table.insert(ensure_installed, server)
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
