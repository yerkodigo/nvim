# Neovim Configuration

A comprehensive, modern Neovim configuration focused on development productivity with LSP support, AI assistance, and beautiful UI components.

## ✨ Features

- 🚀 **Fast startup** with lazy loading via [lazy.nvim](https://github.com/folke/lazy.nvim)
- 🎨 **Custom colorscheme** with light/dark mode support
- 🤖 **AI Integration** with GitHub Copilot and Copilot Chat
- 📁 **File Management** with Neo-tree and Telescope
- 🔧 **Full LSP Support** for TypeScript, JavaScript, Vue, Lua, and more
- 🎯 **Smart Autocompletion** with nvim-cmp and snippets
- 🔍 **Fuzzy Finding** with Telescope
- 📝 **Session Management** with auto-session
- 🎪 **Beautiful UI** with status line, buffer line, and dashboard
- ⚡ **Git Integration** with Gitsigns
- 🌳 **Syntax Highlighting** with Treesitter

## 📋 Requirements

### System Dependencies
- **Neovim** >= 0.9.0
- **Git** >= 2.19.0
- **Node.js** >= 16.0.0 (for LSP servers)
- **Python 3** with pip (for some LSP servers)
- **Ripgrep** (for Telescope live grep)
- **fd** (for better file finding)

### Required System Packages

#### Ubuntu/Debian:
```bash
sudo apt update
sudo apt install ripgrep fd-find nodejs npm python3 python3-pip git curl
```

#### macOS:
```bash
brew install ripgrep fd node python3 git
```

#### Arch Linux:
```bash
sudo pacman -S ripgrep fd nodejs npm python python-pip git
```

## 🚀 Installation

### 1. Backup existing configuration (if any)
```bash
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
mv ~/.local/state/nvim ~/.local/state/nvim.backup
mv ~/.cache/nvim ~/.cache/nvim.backup
```

### 2. Clone this configuration
```bash
git clone https://github.com/yerkodigo/nvim.git ~/.config/nvim
```

### 3. Start Neovim
```bash
nvim
```

The configuration will automatically:
- Install lazy.nvim plugin manager
- Download and install all plugins
- Set up LSP servers via Mason
- Configure all tools and dependencies

### 4. Post-installation steps
1. Run `:checkhealth` to verify everything is working correctly
2. Run `:Mason` to check LSP server installations
3. Restart Neovim for all changes to take effect

## 📁 Configuration Structure

```
~/.config/nvim/
├── init.lua                 # Entry point and lazy.nvim bootstrap
├── lazy-lock.json          # Plugin version lock file
└── lua/
    ├── config/             # Core configuration
    │   ├── init.lua        # Main config loader
    │   ├── options.lua     # Neovim options and settings
    │   ├── keymaps.lua     # Key mappings
    │   ├── autocmds.lua    # Auto commands
    │   ├── lazy.lua        # Lazy.nvim setup
    │   └── commit-modal.lua # Git commit modal
    ├── plugins/            # Plugin specifications
    │   ├── init.lua        # Plugin loader
    │   ├── core.lua        # Core plugins
    │   ├── mason.lua       # Mason LSP installer
    │   ├── lsp/           # LSP configuration
    │   │   └── init.lua    # LSP setup and servers
    │   └── plugins/       # Individual plugin configs
    │       ├── telescope.lua     # File finder
    │       ├── neotree.lua      # File explorer
    │       ├── nvim-cmp.lua     # Autocompletion
    │       ├── copilot.lua      # GitHub Copilot
    │       ├── colorscheme.lua  # Theme configuration
    │       └── ...              # Other plugins
    └── util/              # Utility functions
        ├── init.lua       # Utility functions
        └── lsp.lua        # LSP utilities
```

## 🔌 Plugins

### Core Functionality
- **[lazy.nvim](https://github.com/folke/lazy.nvim)** - Modern plugin manager
- **[mason.nvim](https://github.com/mason-org/mason.nvim)** - LSP server installer
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - LSP configuration

### File Management & Navigation
- **[neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)** - File explorer
- **[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finder
- **[auto-session](https://github.com/rmagatti/auto-session)** - Session management

### Code Intelligence
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Autocompletion engine
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)** - Snippet engine
- **[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Syntax highlighting
- **[copilot.vim](https://github.com/github/copilot.vim)** - GitHub Copilot integration
- **[CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim)** - AI chat interface

### UI & Appearance
- **[yka.mono](https://github.com/yerkodigo/yka.mono)** - Custom colorscheme
- **[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** - Status line
- **[bufferline.nvim](https://github.com/akinsho/bufferline.nvim)** - Buffer tabs
- **[alpha-nvim](https://github.com/goolord/alpha-nvim)** - Start screen dashboard
- **[indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)** - Indentation guides

### Development Tools
- **[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)** - Git integration
- **[conform.nvim](https://github.com/stevearc/conform.nvim)** - Code formatting
- **[Comment.nvim](https://github.com/numToStr/Comment.nvim)** - Smart commenting
- **[nvim-autopairs](https://github.com/windwp/nvim-autopairs)** - Auto pairs
- **[which-key.nvim](https://github.com/folke/which-key.nvim)** - Key binding hints

### Quality of Life
- **[dressing.nvim](https://github.com/stevearc/dressing.nvim)** - Better UI components
- **[nvim-notify](https://github.com/rcarriga/nvim-notify)** - Notification system
- **[neoscroll.nvim](https://github.com/karb94/neoscroll.nvim)** - Smooth scrolling
- **[todo-comments.nvim](https://github.com/folke/todo-comments.nvim)** - TODO highlighting

## ⌨️ Key Mappings

### Leader Key
- Leader key: `<Space>`
- Local leader: `\`

### General
| Key | Mode | Action |
|-----|------|--------|
| `jk` | Insert | Exit insert mode |
| `<leader>w` | Normal | Save file |
| `<C-s>` | Normal | Save file |
| `<leader>q` | Normal | Close window/tab |
| `<leader> q` | Normal | Save all and quit |

### Window Management
| Key | Mode | Action |
|-----|------|--------|
| `<leader>sv` | Normal | Split window vertically |
| `<leader>sh` | Normal | Split window horizontally |
| `<leader>se` | Normal | Make splits equal size |
| `<leader>sx` | Normal | Close current split |
| `<C-M-h>` | Normal | Resize window left |
| `<C-M-l>` | Normal | Resize window right |
| `<C-M-j>` | Normal | Resize window down |
| `<C-M-k>` | Normal | Resize window up |

### Tab Management
| Key | Mode | Action |
|-----|------|--------|
| `<C-n>` | Normal | Open new tab |
| `<A-l>` | Normal | Go to next tab |
| `<A-h>` | Normal | Go to previous tab |

### File Explorer (Neo-tree)
| Key | Mode | Action |
|-----|------|--------|
| `<leader>nt` | Normal | Toggle Neo-tree |

### Telescope (Fuzzy Finder)
| Key | Mode | Action |
|-----|------|--------|
| `<leader>p` | Normal | Find files |
| `<leader>fr` | Normal | Recent files |
| `<leader>ag` | Normal | Live grep |
| `<leader>fc` | Normal | Find string under cursor |
| `<leader>ft` | Normal | Find TODOs |
| `<leader>gs` | Normal | Git status |

### LSP
| Key | Mode | Action |
|-----|------|--------|
| `gd` | Normal | Go to definition |
| `gr` | Normal | Show references |
| `gI` | Normal | Go to implementation |
| `gy` | Normal | Go to type definition |
| `gD` | Normal | Go to declaration |
| `K` | Normal | Show hover documentation |
| `<leader>ca` | Normal/Visual | Code actions |
| `<leader>rn` | Normal | Rename symbol |

### Copilot
| Key | Mode | Action |
|-----|------|--------|
| `<S-Tab>` | Insert | Accept Copilot suggestion |
| `<C-j>` | Insert | Next suggestion |
| `<C-k>` | Insert | Previous suggestion |
| `<C-l>` | Insert | Trigger suggestion |
| `<C-h>` | Insert | Accept suggestion with Enter |

### Colorscheme
| Key | Mode | Action |
|-----|------|--------|
| `<leader>dt` | Normal | Dark theme |
| `<leader>lt` | Normal | Light theme |

### Formatting & Editing
| Key | Mode | Action |
|-----|------|--------|
| `<leader>f` | Normal | Reformat entire file |
| `<leader>F` | Normal | Format around cursor |
| `<C-c>` | Visual | Copy to system clipboard |

## ⚙️ Configuration

### LSP Servers
The configuration automatically installs and configures these LSP servers:
- **lua_ls** - Lua language server
- **ts_ls** - TypeScript/JavaScript language server
- **vue_ls** - Vue language server
- Additional servers can be added in `lua/plugins/lsp/init.lua`

### Adding New LSP Servers
1. Edit `lua/plugins/lsp/init.lua`
2. Add server configuration to the `servers` table:
```lua
servers = {
  -- Add your server here
  pyright = {
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic",
        },
      },
    },
  },
}
```

### Customizing Options
Modify `lua/config/options.lua` to change Neovim settings:
```lua
local opt = vim.opt

-- Example customizations
opt.tabstop = 4        -- Tab width
opt.shiftwidth = 4     -- Shift width
opt.relativenumber = false  -- Disable relative numbers
```

### Adding Custom Key Mappings
Edit `lua/config/keymaps.lua`:
```lua
local keymap = vim.keymap

-- Example custom keymap
keymap.set("n", "<leader>hello", ":echo 'Hello World!'<CR>", { desc = "Say hello" })
```

### Plugin Configuration
Individual plugin configurations are in `lua/plugins/plugins/`. To modify a plugin:

1. Find the corresponding `.lua` file
2. Modify the configuration options
3. Restart Neovim

## 🎨 Theming

The configuration uses a custom colorscheme **yka.mono** with both light and dark variants:

- **Dark theme**: `<leader>dt`
- **Light theme**: `<leader>lt`

To use a different colorscheme, edit `lua/plugins/plugins/colorscheme.lua`.

## 🔧 Troubleshooting

### Common Issues

#### LSP servers not working
1. Run `:Mason` to check if servers are installed
2. Run `:LspInfo` to check server status
3. Run `:checkhealth` for detailed diagnostics

#### Copilot not working
1. Make sure you're signed in: `:Copilot setup`
2. Check status: `:Copilot status`
3. Restart: `:Copilot disable` then `:Copilot enable`

#### Telescope can't find files
1. Install ripgrep and fd: `sudo apt install ripgrep fd-find`
2. Check if you're in a git repository
3. Try `:Telescope find_files hidden=true`

#### Plugin errors on startup
1. Update plugins: `:Lazy update`
2. Clear cache: `:Lazy clear`
3. Reinstall: `:Lazy clean` then restart Neovim

#### Performance issues
1. Check startup time: `nvim --startuptime startup.log`
2. Disable unused plugins in plugin configurations
3. Reduce treesitter parsers if needed

### Getting Help
- Run `:checkhealth` for comprehensive diagnostics
- Check `:Lazy` for plugin status
- Use `:help` for Neovim documentation
- Check individual plugin documentation for specific issues

## 📝 License

This configuration is open source and available under the MIT License.

## 🤝 Contributing

Feel free to fork this configuration and make it your own! If you have improvements or bug fixes, pull requests are welcome.

---

**Happy coding with Neovim! 🚀**