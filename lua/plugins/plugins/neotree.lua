return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
      { "<leader>nt", "<cmd>Neotree reveal=true toggle<CR>", desc = "Toggle Neo-tree en ubicación actual" },
    },
    config = function()
      -- Crear grupo de autocomandos para Neo-tree
      local neotree_group = vim.api.nvim_create_augroup("NeoTreeCustom", { clear = true })

      -- Función para cerrar Neo-tree correctamente cuando es la última ventana
      vim.api.nvim_create_autocmd("BufEnter", {
        group = neotree_group,
        callback = function()
          local layout = vim.api.nvim_call_function("winlayout", {})
          if
            layout[1] == "leaf"
            and vim.api.nvim_get_option_value("filetype", { buf = vim.api.nvim_win_get_buf(layout[2]) }) == "neo-tree"
            and layout[3] == nil
          then
            vim.cmd("confirm quit")
          end
        end,
      })

      -- Interceptar cuando se intenta cerrar el buffer de Neo-tree con :q
      -- Esto previene el error E95: Buffer with this name already exists
      vim.api.nvim_create_autocmd("FileType", {
        group = neotree_group,
        pattern = "neo-tree",
        callback = function(args)
          local bufnr = args.buf

          -- Sobrescribir <leader>q localmente para usar el cierre correcto de Neo-tree
          vim.keymap.set("n", "<leader>q", function()
            require("neo-tree.command").execute({ action = "close" })
          end, { buffer = bufnr, desc = "Cerrar Neo-tree correctamente", silent = true })
        end,
      })

      -- Interceptar QuitPre para prevenir el cierre incorrecto
      vim.api.nvim_create_autocmd("QuitPre", {
        group = neotree_group,
        callback = function()
          -- Verificar si estamos intentando cerrar un buffer de neo-tree
          local bufnr = vim.api.nvim_get_current_buf()
          local filetype = vim.bo[bufnr].filetype

          if filetype == "neo-tree" then
            -- Cancelar el quit y usar el método correcto de neo-tree
            vim.defer_fn(function()
              pcall(require("neo-tree.command").execute, { action = "close" })
            end, 10)
            return true -- Prevenir el quit normal
          end
        end,
      })

      require("neo-tree").setup({
        close_if_last_window = true, -- Cierra Neo-tree si es la última ventana
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        sort_case_insensitive = false,

        default_component_configs = {
          container = {
            enable_character_fade = true,
          },
          indent = {
            indent_size = 2,
            padding = 1,
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
          },
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            default = "*",
            highlight = "NeoTreeFileIcon",
          },
          modified = {
            symbol = "[+]",
            highlight = "NeoTreeModified",
          },
          name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
          },
          git_status = {
            symbols = {
              added = "",
              modified = "",
              deleted = "✖",
              renamed = "󰁕",
              untracked = "",
              ignored = "",
              unstaged = "󰄱",
              staged = "",
              conflict = "",
            },
          },
        },

        window = {
          position = "left",
          width = 35,
          mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
            ["<space>"] = { "toggle_node", nowait = false },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["<esc>"] = "cancel",
            ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
            ["l"] = "focus_preview",
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            ["t"] = "open_tabnew",
            ["w"] = "open_with_window_picker",
            ["C"] = "close_node",
            ["z"] = "close_all_nodes",
            ["a"] = {
              "add",
              config = {
                show_path = "none",
              },
            },
            ["A"] = "add_directory",
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy",
            ["m"] = "move",
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
            ["i"] = "show_file_details",
          },
        },

        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = true,
            hide_by_name = {
              "node_modules",
            },
            hide_by_pattern = {
              "*.meta",
              "*/src/*/tsconfig.json",
            },
            always_show = {
              ".gitignored",
              ".env",
            },
            never_show = {
              ".DS_Store",
              "thumbs.db",
            },
            never_show_by_pattern = {},
          },
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },
          group_empty_dirs = false,
          hijack_netrw_behavior = "open_default",
          use_libuv_file_watcher = false,
          window = {
            mappings = {
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
              ["H"] = "toggle_hidden",
              ["/"] = "fuzzy_finder",
              ["D"] = "fuzzy_finder_directory",
              ["#"] = "fuzzy_sorter",
              ["f"] = "filter_on_submit",
              ["<c-x>"] = "clear_filter",
              ["[g"] = "prev_git_modified",
              ["]g"] = "next_git_modified",
              ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
              ["oc"] = { "order_by_created", nowait = false },
              ["od"] = { "order_by_diagnostics", nowait = false },
              ["og"] = { "order_by_git_status", nowait = false },
              ["om"] = { "order_by_modified", nowait = false },
              ["on"] = { "order_by_name", nowait = false },
              ["os"] = { "order_by_size", nowait = false },
              ["ot"] = { "order_by_type", nowait = false },
            },
            fuzzy_finder_mappings = {
              ["<down>"] = "move_cursor_down",
              ["<C-n>"] = "move_cursor_down",
              ["<up>"] = "move_cursor_up",
              ["<C-p>"] = "move_cursor_up",
            },
          },
        },

        buffers = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },
          group_empty_dirs = true,
          show_unloaded = true,
          window = {
            mappings = {
              ["bd"] = "buffer_delete",
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
              ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
              ["oc"] = { "order_by_created", nowait = false },
              ["od"] = { "order_by_diagnostics", nowait = false },
              ["om"] = { "order_by_modified", nowait = false },
              ["on"] = { "order_by_name", nowait = false },
              ["os"] = { "order_by_size", nowait = false },
              ["ot"] = { "order_by_type", nowait = false },
            },
          },
        },

        git_status = {
          window = {
            position = "float",
            mappings = {
              ["A"] = "git_add_all",
              ["gu"] = "git_unstage_file",
              ["ga"] = "git_add_file",
              ["gr"] = "git_revert_file",
              ["gc"] = "git_commit",
              ["gp"] = "git_push",
              ["gg"] = "git_commit_and_push",
              ["o"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "o" } },
              ["oc"] = { "order_by_created", nowait = false },
              ["od"] = { "order_by_diagnostics", nowait = false },
              ["om"] = { "order_by_modified", nowait = false },
              ["on"] = { "order_by_name", nowait = false },
              ["os"] = { "order_by_size", nowait = false },
              ["ot"] = { "order_by_type", nowait = false },
            },
          },
        },

        event_handlers = {
          {
            event = "file_opened",
            handler = function()
              -- Cierra Neo-tree cuando se abre un archivo
              require("neo-tree.command").execute({ action = "close" })
            end,
          },
          {
            event = "neo_tree_buffer_enter",
            handler = function()
              vim.cmd("highlight! Cursor blend=100")
            end,
          },
          {
            event = "neo_tree_buffer_leave",
            handler = function()
              vim.cmd("highlight! Cursor guibg=#5f87af blend=0")
            end,
          },
        },
      })
    end,
  },
}

