return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")
      conform.setup({
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          vue = { "prettier" },
          svelte = { "prettier" },
          css = { "prettier" },
          scss = { "prettier" },
          less = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          jsonc = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          graphql = { "prettier" },
          liquid = { "prettier" },
          lua = { "stylua" },
          python = { "isort", "black" },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>mp", function()
        conform.format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 1000,
        })
      end, { desc = "Format file or range (in visual mode)" })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      -- Si eslint_d no existe, usar eslint
      local use_eslint_d = vim.fn.executable("eslint_d") == 1
      local js_linter = use_eslint_d and "eslint_d" or "eslint"

      lint.linters_by_ft = {
        javascript = { js_linter },
        typescript = { js_linter },
        javascriptreact = { js_linter },
        typescriptreact = { js_linter },
        vue = { js_linter },
        svelte = { js_linter },
        python = { "pylint" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      -- Sólo lanzar lint si hay linter configurado para este filetype
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          local ft = vim.bo.filetype
          if lint.linters_by_ft[ft] then
            lint.try_lint()
          end
        end,
      })

      -- Commands to disable/enable linting
      vim.api.nvim_create_user_command("LintDisable", function()
        lint_enabled = false
        vim.notify("nvim-lint disabled", vim.log.levels.INFO)
      end, { desc = "Disable nvim-lint" })

      vim.api.nvim_create_user_command("LintEnable", function()
        lint_enabled = true
        vim.notify("nvim-lint enabled", vim.log.levels.INFO)
        -- trigger lint immediately for current buffer if configured
        local ft = vim.bo.filetype
        if lint.linters_by_ft[ft] then
          lint.try_lint()
        end
      end, { desc = "Enable nvim-lint" })

      vim.keymap.set("n", "<leader>ll", function()
        local ft = vim.bo.filetype
        if lint.linters_by_ft[ft] then
          lint.try_lint()
        else
          vim.notify("No lint configured for filetype: " .. ft, vim.log.levels.WARN)
        end
      end, { desc = "Trigger linting for current file" })
    end,
  },
}
