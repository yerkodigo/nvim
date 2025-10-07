return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim",        branch = "master" },
      { "nvim-telescope/telescope.nvim" }, -- Para mejor UI selection
    },
    build = "make tiktoken",               -- Construye tiktoken para conteo preciso de tokens
    event = "VeryLazy",

    opts = {
      -- Modelo por defecto (similar a VSCode)
      model = 'gpt-4.1',

      -- Configuración de temperatura para respuestas más consistentes
      temperature = 0.1,

      -- Configuración de ventana similar a VSCode
      window = {
        layout = 'vertical', -- Panel lateral como en VSCode
        width = 0.4,         -- 40% del ancho de pantalla
        height = 1.0,        -- Altura completa
        border = 'rounded',
        title = ' Copilot Chat',
        zindex = 100,
      },

      -- Entrar automáticamente en modo inserción
      auto_insert_mode = true,

      -- Headers personalizados para mejor experiencia visual
      headers = {
        user = '󰭹 You: ',
        assistant = ' Copilot: ',
        tool = ' Tool: ',
      },

      -- Separador visual
      separator = '───',

      -- Mostrar información de tokens y modelo
      show_folds = true,

      -- Configuración de selección automática
      selection = function(source)
        return require('CopilotChat.select').visual(source) or
            require('CopilotChat.select').line(source)
      end,

      -- Prompts personalizados para flujo de trabajo
      prompts = {
        Explain = {
          prompt = '/COPILOT_EXPLAIN Explica el código seleccionado de manera clara y detallada en español',
          mapping = '<leader>cce',
          description = 'Explicar código seleccionado',
        },
        Review = {
          prompt = '/COPILOT_REVIEW Revisa el código y sugiere mejoras en español.',
          mapping = '<leader>ccr',
          description = 'Revisar código',
        },
        Fix = {
          prompt = '/COPILOT_GENERATE Identifica y corrige cualquier problema en el código. Responde en español',
          mapping = '<leader>ccf',
          description = 'Corregir código',
        },
        Optimize = {
          prompt = '/COPILOT_GENERATE Optimiza el código para mejor rendimiento y legibilidad.',
          mapping = '<leader>cco',
          description = 'Optimizar código',
        },
        Docs = {
          prompt = '/COPILOT_GENERATE Agrega documentación completa al código.',
          mapping = '<leader>ccd',
          description = 'Documentar código',
        },
        Tests = {
          prompt = '/COPILOT_GENERATE Genera tests comprehensivos para el código.',
          mapping = '<leader>cct',
          description = 'Generar tests',
        },
        Commit = {
          prompt = 'Escribe un mensaje de commit siguiendo convenciones para los cambios staged.',
          mapping = '<leader>ccc',
          description = 'Generar mensaje de commit',
        },
        Refactor = {
          prompt = '/COPILOT_GENERATE Refactoriza el código manteniendo la funcionalidad.',
          mapping = '<leader>ccR',
          description = 'Refactorizar código',
        },
        BugFix = {
          prompt = '/COPILOT_GENERATE Analiza y corrige el bug en el código.',
          mapping = '<leader>ccB',
          description = 'Corregir bug',
        },
      },
    },

    config = function(_, opts)
      local chat = require("CopilotChat")

      -- Configurar CopilotChat
      chat.setup(opts)

      -- Configurar telescope para mejor UI selection
      pcall(function()
        require('telescope').setup({
          extensions = {
            ['ui-select'] = {
              require('telescope.themes').get_dropdown({})
            }
          }
        })
        require('telescope').load_extension('ui-select')
      end)

      -- Auto comando para personalizar el buffer de chat
      vim.api.nvim_create_autocmd('BufEnter', {
        pattern = 'copilot-*',
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
          vim.opt_local.conceallevel = 0
          vim.opt_local.wrap = true
          vim.opt_local.linebreak = true
        end,
      })

      -- Highlights personalizados para mejor apariencia
      vim.api.nvim_set_hl(0, 'CopilotChatHeader', { fg = '#7C3AED', bold = true })
      vim.api.nvim_set_hl(0, 'CopilotChatSeparator', { fg = '#374151' })
      vim.api.nvim_set_hl(0, 'CopilotChatStatus', { fg = '#10B981' })
      vim.api.nvim_set_hl(0, 'CopilotChatResource', { fg = '#F59E0B', italic = true })
      vim.api.nvim_set_hl(0, 'CopilotChatTool', { fg = '#8B5CF6', bold = true })
    end,

    keys = {
      -- Open chat with current buffer
      {
        "<leader>ccb",
        function() require("CopilotChat").ask("#buffer") end,
        desc = "Chat with current buffer"
      },

      -- Open chat with entire project
      {
        "<leader>ccp",
        function() require("CopilotChat").ask("#buffers:listed") end,
        desc = "Chat with project"
      },
      -- Switch between AI models
      { "<leader>ccm", "<cmd>CopilotChatModels<cr>", desc = "Select Copilot Chat Model" },
      -- Explain selected fragment
      {
        "<leader>cce",
        function()
          require("CopilotChat").ask("/COPILOT_EXPLAIN", { selection = require("CopilotChat.select").visual })
        end,
        mode = "v",
        desc = "Explain selection"
      },
      -- Improve selected fragment
      {
        "<leader>cci",
        function()
          require("CopilotChat").ask("/COPILOT_GENERATE Optimizar selección",
            { selection = require("CopilotChat.select").visual })
        end,
        mode = "v",
        desc = "Improve selection"
      },
      -- Fix selected fragment
      {
        "<leader>ccf",
        function()
          require("CopilotChat").ask("/COPILOT_GENERATE Corregir selección",
            { selection = require("CopilotChat.select").visual })
        end,
        mode = "v",
        desc = "Fix selection"
      },

      -- -- Comando principal para toggle (más usado)
      -- { "<leader>cc",  "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
      --
      -- -- Comandos principales del chat
      -- { "<leader>cco", "<cmd>CopilotChatOpen<cr>",   desc = "Open Copilot Chat" },
      -- { "<leader>ccx", "<cmd>CopilotChatClose<cr>",  desc = "Close Copilot Chat" },
      -- { "<leader>ccC", "<cmd>CopilotChatReset<cr>",  desc = "Reset Copilot Chat" },
      -- { "<leader>ccS", "<cmd>CopilotChatStop<cr>",   desc = "Stop Copilot Chat" },
      --
      -- -- ===============================
      -- -- CONTEXTO DE BUFFER ACTUAL
      -- -- ===============================
      --
      -- -- Chat con todo el buffer actual (equivalente a "current file" en VSCode)
      -- {
      --   "<leader>ccb",
      --   function()
      --     require("CopilotChat").ask("#buffer")
      --   end,
      --   desc = "Chat with current buffer"
      -- },
      --
      -- -- Chat interactivo con buffer actual
      -- {
      --   "<leader>ccB",
      --   function()
      --     local input = vim.fn.input("Chat with current buffer: ")
      --     if input ~= "" then
      --       require("CopilotChat").ask("#buffer " .. input)
      --     end
      --   end,
      --   desc = "Interactive chat with current buffer"
      -- },
      --
      -- -- Explicar todo el buffer actual
      -- {
      --   "<leader>ccE",
      --   function()
      --     require("CopilotChat").ask(
      --       "#buffer Explica detalladamente qué hace este código, su propósito y cómo funciona.")
      --   end,
      --   desc = "Explain current buffer"
      -- },
      --
      -- -- ===============================
      -- -- CONTEXTO DE TODO EL PROYECTO
      -- -- ===============================
      --
      -- -- Chat con todos los buffers listados (archivos abiertos del proyecto)
      -- {
      --   "<leader>ccp",
      --   function()
      --     require("CopilotChat").ask("#buffers:listed ¿Cómo está estructurado este proyecto?")
      --   end,
      --   desc = "Chat with project buffers"
      -- },
      --
      -- -- Chat interactivo con todo el proyecto
      -- {
      --   "<leader>ccP",
      --   function()
      --     local input = vim.fn.input("Chat with project: ")
      --     if input ~= "" then
      --       require("CopilotChat").ask("#buffers:listed " .. input)
      --     end
      --   end,
      --   desc = "Interactive chat with project"
      -- },
      --
      -- -- Análisis completo del proyecto usando @copilot (tool calling)
      -- {
      --   "<leader>ccA",
      --   function()
      --     require("CopilotChat").ask(
      --       "@copilot Analiza la estructura de este proyecto, identifica los archivos principales y explica la arquitectura general.")
      --   end,
      --   desc = "Analyze project structure"
      -- },
      --
      -- -- Chat con buffers visibles (ventanas abiertas)
      -- {
      --   "<leader>ccV",
      --   function()
      --     local input = vim.fn.input("Chat with visible buffers: ")
      --     if input ~= "" then
      --       require("CopilotChat").ask("#buffers:visible " .. input)
      --     end
      --   end,
      --   desc = "Chat with visible buffers"
      -- },
      --
      -- -- ===============================
      -- -- CONTEXTO CON GIT (PROYECTO)
      -- -- ===============================
      --
      -- -- Chat con cambios de git (staged)
      -- {
      --   "<leader>ccg",
      --   function()
      --     local input = vim.fn.input("Chat with git staged: ")
      --     if input ~= "" then
      --       require("CopilotChat").ask("#gitdiff:staged " .. input)
      --     end
      --   end,
      --   desc = "Chat with git staged changes"
      -- },
      --
      -- -- Chat con todos los cambios git
      -- {
      --   "<leader>ccG",
      --   function()
      --     local input = vim.fn.input("Chat with all git changes: ")
      --     if input ~= "" then
      --       require("CopilotChat").ask("#gitdiff " .. input)
      --     end
      --   end,
      --   desc = "Chat with all git changes"
      -- },
      --
      -- -- ===============================
      -- -- OTRAS FUNCIONES ÚTILES
      -- -- ===============================
      --
      -- -- Chat rápido sin contexto específico
      -- {
      --   "<leader>ccq",
      --   function()
      --     local input = vim.fn.input("Quick Chat: ")
      --     if input ~= "" then
      --       require("CopilotChat").ask(input)
      --     end
      --   end,
      --   desc = "Quick Chat",
      --   mode = { "n", "v" }
      -- },
      --
      -- -- Chat con selección visual
      -- {
      --   "<leader>ccv",
      --   function()
      --     local input = vim.fn.input("Chat with selection: ")
      --     if input ~= "" then
      --       require("CopilotChat").ask(input, { selection = require("CopilotChat.select").visual })
      --     end
      --   end,
      --   desc = "Chat with visual selection",
      --   mode = "v"
      -- },
      --
      -- -- Chat con línea actual
      -- {
      --   "<leader>cci",
      --   function()
      --     local input = vim.fn.input("Chat with line: ")
      --     if input ~= "" then
      --       require("CopilotChat").ask(input, { selection = require("CopilotChat.select").line })
      --     end
      --   end,
      --   desc = "Chat with current line"
      -- },
      --
      -- -- Selección de prompts y modelos
      -- { "<leader>ccm", "<cmd>CopilotChatModels<cr>",  desc = "Select Copilot Chat Model" },
      -- { "<leader>ccs", "<cmd>CopilotChatPrompts<cr>", desc = "Select Copilot Chat Prompts" },
      --
      -- -- Gestión de historial
      -- {
      --   "<leader>cch",
      --   function()
      --     local name = vim.fn.input("Save chat as: ")
      --     if name ~= "" then
      --       require("CopilotChat").save(name)
      --     end
      --   end,
      --   desc = "Save chat history"
      -- },
      --
      -- {
      --   "<leader>ccl",
      --   function()
      --     local name = vim.fn.input("Load chat: ")
      --     if name ~= "" then
      --       require("CopilotChat").load(name)
      --     end
      --   end,
      --   desc = "Load chat history"
      -- },
      --
      -- Prompts específicos (definidos en opts.prompts)
      -- Estos se mapean automáticamente desde la configuración de prompts
    },
  },
}
