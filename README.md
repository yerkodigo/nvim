# Configuración Neovim para Desarrollo Full Stack

Configuración profesional de Neovim optimizada para desarrollo con **Vue.js 3**, **JavaScript**, **TypeScript**, **HTML**, **CSS**, **Node.js** y **Express.js**. Diseñada específicamente para funcionar en **WSL (Windows Subsystem for Linux)**.

## ✨ Características

- 🚀 **LSP completo** con Volar para Vue 3, TypeScript, HTML, CSS, ESLint
- 💡 **Autocompletado inteligente** con nvim-cmp
- ✨ **Formateo automático** con Prettier y Conform  
- 🔍 **Linting** con ESLint/eslint_d
- 🌳 **Git integration** con Gitsigns y comandos integrados
- 📁 **Explorador de archivos** Neo-tree con integración de bookmarks
- 🔭 **Búsqueda difusa** con Telescope
- 💾 **Gestión de sesiones** automática por proyecto
- 🔖 **Bookmarks** con Arrow.nvim (persistencia por proyecto)
- 🤖 **GitHub Copilot** integrado con chat
- 🎨 **Tema personalizado** yka-mono
- ⚡ **Carga rápida** con lazy loading

## 📋 Requisitos Previos

### Sistema Operativo
- **Windows 11** con WSL2
- **Ubuntu 22.04 LTS** o superior en WSL

### Versiones Mínimas Requeridas
- Neovim >= **0.10.0**
- Node.js >= **18.x**
- Git >= **2.30**
- ripgrep >= **13.0**
- fd >= **8.0**

---

## 📑 Tabla de Contenidos

1. [Instalación de Dependencias](#-instalación-de-dependencias)
2. [Instalación de Fuentes Nerd Font](#-instalación-de-fuentes-nerd-font)
3. [Configuración de WSL](#-configuración-de-wsl)
4. [Instalación de Neovim](#-instalación-de-neovim)
5. [Instalación de esta Configuración](#-instalación-de-esta-configuración)
6. [Instalación de LSP Servers](#-instalación-de-lsp-servers)
7. [Plugins Incluidos](#-plugins-incluidos)
8. [Keymaps Principales](#-keymaps-principales)
9. [Comandos Útiles](#-comandos-útiles)
10. [Solución de Problemas](#-solución-de-problemas)

---

## 🔧 Instalación de Dependencias

### 1. Actualizar Sistema (WSL/Ubuntu)

```bash
sudo apt update && sudo apt upgrade -y
```

### 2. Instalar Herramientas Esenciales

```bash
# Build tools y compiladores
sudo apt install -y build-essential cmake pkg-config

# Git
sudo apt install -y git

# Ripgrep (para búsqueda rápida en archivos)
sudo apt install -y ripgrep

# Fd (para búsqueda de archivos)
sudo apt install -y fd-find

# Crear symlink para fd (necesario en Debian/Ubuntu)
mkdir -p ~/.local/bin
ln -s $(which fdfind) ~/.local/bin/fd

# Verificar instalación
fd --version
```

### 3. Instalar Node.js y npm

```bash
# Instalar nvm (Node Version Manager) - Recomendado
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Recargar configuración del shell
source ~/.bashrc

# Instalar Node.js LTS
nvm install --lts
nvm use --lts

# Verificar instalación
node --version  # Debe mostrar v18.x o superior
npm --version
```

### 4. Instalar Python (para proveedores de Neovim)

```bash
sudo apt install -y python3 python3-pip python3-venv

# Instalar proveedor de Python para Neovim
pip3 install --user pynvim
```

### 5. Instalar Herramientas de Clipboard para WSL

**Opción A: win32yank (Recomendado para WSL)**

```bash
# Descargar win32yank
curl -sLo /tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip

# Extraer e instalar
unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin/

# Verificar
win32yank.exe --version
```

**Opción B: xclip y wl-clipboard**

```bash
sudo apt install -y xclip wl-clipboard
```

---

## 🔤 Instalación de Fuentes Nerd Font

Las **Nerd Fonts** son **esenciales** para que los iconos se muestren correctamente en Neovim.

### Método 1: Instalación en Windows (Recomendado para WSL)

1. **Descargar JetBrainsMono Nerd Font**:
   - Ve a: https://www.nerdfonts.com/font-downloads
   - Descarga **JetBrainsMono Nerd Font**

2. **Instalar la fuente**:
   - Extrae el archivo ZIP descargado
   - Selecciona todos los archivos `.ttf`
   - Clic derecho → **Instalar para todos los usuarios**

3. **Configurar Windows Terminal**:
   - Abre **Windows Terminal**
   - Ve a Settings (Ctrl+,)
   - Profiles → Ubuntu (tu perfil WSL)
   - Appearance → Font face → Selecciona **JetBrainsMono Nerd Font**
   - Font size: **10** o **11**
   - Guarda los cambios

4. **Reinicia Windows Terminal** para aplicar los cambios

### Método 2: Instalación Automática en WSL

```bash
# Crear directorio de fuentes
mkdir -p ~/.local/share/fonts

# Descargar JetBrainsMono Nerd Font
cd /tmp
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip

# Extraer e instalar
unzip JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono

# Actualizar caché de fuentes
fc-cache -fv

# Verificar instalación
fc-list | grep "JetBrains"
```

### Fuentes Alternativas Recomendadas

- **FiraCode Nerd Font**
- **Hack Nerd Font**
- **Meslo Nerd Font**
- **CascadiaCode Nerd Font**

> **Nota**: Si los iconos no se muestran correctamente después de instalar la fuente, asegúrate de que tu terminal esté configurada para usar la Nerd Font y reinicia completamente el terminal.

---

## 🐧 Configuración de WSL

### 1. Habilitar y Configurar WSL2

En **PowerShell como Administrador**:

```powershell
# Habilitar WSL
wsl --install

# Actualizar a WSL2 (si no está ya)
wsl --set-default-version 2

# Verificar versión
wsl --list --verbose
```

### 2. Configurar Variables de Entorno en WSL

Agrega estas líneas al final de `~/.bashrc`:

```bash
# Editor por defecto
export EDITOR=nvim
export VISUAL=nvim

# Configuración de Node
export NODE_OPTIONS="--max-old-space-size=4096"

# Path local
export PATH="$HOME/.local/bin:$PATH"

# Clipboard en WSL (para integración con Windows)
export DISPLAY=:0
```

Recarga la configuración:

```bash
source ~/.bashrc
```

### 3. Optimizar Performance de WSL (Opcional pero Recomendado)

Crea o edita el archivo `.wslconfig` en Windows:

**Ubicación**: `C:\Users\TuUsuario\.wslconfig`

```ini
[wsl2]
memory=8GB              # Ajusta según tu RAM disponible
processors=4            # Ajusta según tus cores
swap=2GB
localhostForwarding=true
```

Reinicia WSL para aplicar cambios:

```powershell
wsl --shutdown
```

---

## 💻 Instalación de Neovim

### Método 1: AppImage (Recomendado - Siempre actualizado)

```bash
# Descargar la última versión estable
cd /tmp
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage

# Hacer ejecutable
chmod +x nvim.appimage

# Mover a PATH
sudo mv nvim.appimage /usr/local/bin/nvim

# Verificar instalación
nvim --version  # Debe mostrar >= 0.10.0
```

### Método 2: Desde PPA (Ubuntu)

```bash
# Agregar PPA
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update

# Instalar
sudo apt install -y neovim

# Verificar versión
nvim --version
```

### Método 3: Compilar desde Fuentes (Para última versión de desarrollo)

```bash
# Instalar dependencias
sudo apt install -y ninja-build gettext cmake unzip curl

# Clonar repositorio
git clone https://github.com/neovim/neovim.git /tmp/neovim
cd /tmp/neovim

# Checkout versión estable
git checkout stable

# Compilar e instalar
make CMAKE_BUILD_TYPE=Release
sudo make install

# Verificar
nvim --version
```

---

## 📦 Instalación de esta Configuración

### 1. Hacer Backup de Configuración Anterior (si existe)

```bash
# Backup de configuración
mv ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d)
mv ~/.local/share/nvim ~/.local/share/nvim.backup.$(date +%Y%m%d)
mv ~/.local/state/nvim ~/.local/state/nvim.backup.$(date +%Y%m%d)
mv ~/.cache/nvim ~/.cache/nvim.backup.$(date +%Y%m%d)
```

### 2. Clonar este Repositorio

```bash
# Clonar configuración
git clone https://github.com/yerkodigo/nvim.git ~/.config/nvim

# Ir al directorio
cd ~/.config/nvim
```

### 3. Iniciar Neovim por Primera Vez

```bash
nvim
```

**¿Qué sucede en el primer inicio?**

1. **Lazy.nvim** se instalará automáticamente
2. Comenzará la descarga de **todos los plugins** (puede tardar 2-5 minutos)
3. Se mostrarán mensajes de instalación en la pantalla
4. **No cierres Neovim** hasta que termine la instalación

### 4. Verificar Instalación

Dentro de Neovim, ejecuta:

```vim
:checkhealth
```

Revisa que no haya errores críticos. Los warnings sobre Python2 o Ruby pueden ignorarse si no los necesitas.

---

## 🛠️ Instalación de LSP Servers

Una vez dentro de Neovim, necesitas instalar los Language Servers para que el autocompletado y las características de LSP funcionen.

### Abrir Mason

Dentro de Neovim, ejecuta:

```vim
:Mason
```

### Instalar los siguientes servidores

Presiona `i` sobre cada servidor para instalarlo:

#### Esenciales para Vue.js 3 y JavaScript/TypeScript
- **volar** - Vue Language Server (oficial para Vue 3)
- **typescript-language-server** (ts_ls) - TypeScript/JavaScript
- **html-lsp** - HTML
- **css-lsp** (cssls) - CSS/SCSS/Less
- **eslint-lsp** - ESLint
- **json-lsp** (jsonls) - JSON

#### Formatters y Linters
- **prettier** - Formateador universal
- **stylua** - Formateador de Lua
- **eslint_d** (opcional, más rápido que eslint)

### Instalar Dependencias de Node para Vue.js

En tu proyecto Vue, instala las dependencias necesarias:

```bash
npm install -D @vue/language-server @vue/typescript-plugin
```

O con yarn:

```bash
yarn add -D @vue/language-server @vue/typescript-plugin
```

### Verificar LSP

Abre un archivo `.vue` y ejecuta:

```vim
:LspInfo
```

Deberías ver `volar` y `ts_ls` activos y adjuntos al buffer.

---

## 🔌 Plugins Incluidos

### Gestión de Plugins
- **lazy.nvim** - Plugin manager moderno y rápido

### LSP y Autocompletado
- **nvim-lspconfig** - Configuración de Language Servers
- **mason.nvim** - Instalador de LSP servers
- **mason-lspconfig.nvim** - Integración Mason-LSP
- **nvim-cmp** - Motor de autocompletado
- **cmp-nvim-lsp** - Fuente LSP para nvim-cmp
- **cmp-buffer** - Fuente de buffer
- **cmp-path** - Fuente de paths
- **LuaSnip** - Motor de snippets
- **friendly-snippets** - Colección de snippets

### Formato y Linting
- **conform.nvim** - Formateador con soporte para Prettier
- **nvim-lint** - Linting asíncrono

### Explorador y Búsqueda
- **neo-tree.nvim** - Explorador de archivos en árbol
- **telescope.nvim** - Búsqueda difusa de archivos/texto
- **telescope-fzf-native.nvim** - Extensión nativa FZF

### Git
- **gitsigns.nvim** - Indicadores de Git en columna de signos
- Comandos de git integrados (commit, push)

### UI y Apariencia
- **lualine.nvim** - Statusline elegante
- **bufferline.nvim** - Línea de buffers/tabs
- **alpha-nvim** - Pantalla de inicio
- **which-key.nvim** - Muestra keymaps disponibles
- **nvim-notify** - Notificaciones elegantes
- **dressing.nvim** - Mejores UI inputs
- **indent-blankline.nvim** - Guías de indentación
- **nvim-highlight-colors** - Resalta códigos de color

### Edición
- **nvim-treesitter** - Resaltado de sintaxis avanzado
- **nvim-ts-autotag** - Cierre automático de tags HTML/Vue
- **nvim-autopairs** - Cierre automático de paréntesis
- **Comment.nvim** - Comentarios rápidos

### Productividad
- **arrow.nvim** - Sistema de bookmarks por proyecto
- **auto-session** - Gestión automática de sesiones
- **todo-comments.nvim** - Resalta comentarios TODO
- **neoscroll.nvim** - Scroll suave
- **neominimap.nvim** - Minimapa de código

### GitHub Copilot
- **copilot.vim** - GitHub Copilot
- **CopilotChat.nvim** - Chat con Copilot

### Extras
- **vim-tmux-navigator** - Navegación tmux/nvim
- **lorem.nvim** - Generador de texto Lorem Ipsum
- **schemastore.nvim** - Esquemas JSON

---

## ⌨️ Keymaps Principales

### Tecla Leader
La tecla leader está configurada como **`<Space>`** (barra espaciadora).

### Generales

| Atajo | Modo | Acción |
|-------|------|--------|
| `jk` | Insert | Salir de modo Insert |
| `<leader>nh` | Normal | Limpiar resaltado de búsqueda |
| `<leader>w` | Normal | Guardar archivo |
| `<C-s>` | Normal | Guardar archivo |
| `<leader>q` | Normal | Cerrar ventana/tab |
| `<leader> q` | Normal | Guardar todo y cerrar |
| `<C-c>` | Visual | Copiar al portapapeles del sistema |

### Ventanas y Splits

| Atajo | Acción |
|-------|--------|
| `<leader>sv` | Split vertical |
| `<leader>sh` | Split horizontal |
| `<leader>se` | Igualar tamaño de splits |
| `<leader>sx` | Cerrar split actual |
| `<leader>=` | Restaurar dimensiones |
| `<C-M-h>` | Reducir ancho vertical |
| `<C-M-l>` | Aumentar ancho vertical |
| `<C-M-j>` | Reducir altura |
| `<C-M-k>` | Aumentar altura |

### Tabs

| Atajo | Acción |
|-------|--------|
| `<C-n>` | Nueva tab |
| `<A-l>` | Siguiente tab |
| `<A-h>` | Tab anterior |

### Neo-tree (Explorador de archivos)

| Atajo | Acción |
|-------|--------|
| `<leader>nt` | Toggle Neo-tree |
| `a` | Crear archivo |
| `A` | Crear directorio |
| `d` | Eliminar |
| `r` | Renombrar |
| `y` | Copiar al clipboard |
| `x` | Cortar |
| `p` | Pegar |
| `q` | Cerrar Neo-tree |
| `R` | Refrescar |
| `?` | Mostrar ayuda |

### Telescope (Búsqueda)

| Atajo | Acción |
|-------|--------|
| `<leader>ff` | Buscar archivos |
| `<leader>fg` | Buscar en archivos (grep) |
| `<leader>fb` | Buscar en buffers |
| `<leader>fh` | Buscar en historial |

### LSP

| Atajo | Acción |
|-------|--------|
| `gd` | Ir a definición |
| `gr` | Ver referencias |
| `gI` | Ir a implementación |
| `gy` | Ir a tipo |
| `gD` | Ir a declaración |
| `K` | Hover (documentación) |
| `gK` | Signature help |
| `<leader>ca` | Code actions |
| `<leader>rn` | Renombrar símbolo |
| `<leader>f` | Formatear archivo |

### Git

| Atajo | Acción |
|-------|--------|
| `<leader>gp` | Git preview hunk |
| `<leader>gb` | Git blame línea |
| `<leader>gd` | Git diff |
| `<leader>gr` | Git reset hunk |
| `]c` | Siguiente cambio |
| `[c` | Cambio anterior |

### Bookmarks (Arrow.nvim)

| Atajo | Acción |
|-------|--------|
| `;` | Abrir menú de bookmarks |
| `m` | Toggle bookmark (en buffer) |
| `H` | Bookmark anterior |
| `L` | Siguiente bookmark |
| `<leader>1-9` | Ir a bookmark numerado |

### Comentarios

| Atajo | Modo | Acción |
|-------|------|--------|
| `gcc` | Normal | Comentar línea |
| `gc` | Visual | Comentar selección |

---

## 📝 Comandos Útiles

### Gestión de Plugins

```vim
:Lazy                 " Abrir gestor de plugins
:Lazy sync            " Sincronizar plugins
:Lazy clean           " Limpiar plugins no usados
:Lazy update          " Actualizar plugins
```

### LSP

```vim
:Mason                " Abrir gestor de LSP servers
:LspInfo              " Información de LSP activos
:LspRestart           " Reiniciar LSP servers
```

### Diagnóstico

```vim
:checkhealth          " Diagnóstico completo del sistema
:checkhealth nvim     " Diagnóstico de Neovim
:checkhealth lsp      " Diagnóstico de LSP
```

### Sesiones

```vim
:SessionSave          " Guardar sesión manual
:SessionRestore       " Restaurar sesión
:SessionDelete        " Eliminar sesión
```

---

## 🔧 Solución de Problemas

### 1. Iconos no se muestran correctamente

**Causa**: Nerd Font no instalada o terminal no configurada.

**Solución**:
1. Verifica que instalaste una Nerd Font
2. Configura tu terminal (Windows Terminal) para usar esa fuente
3. Reinicia el terminal completamente

### 2. LSP no funciona (no hay autocompletado)

**Causa**: Language servers no instalados.

**Solución**:
```vim
:Mason
```
Instala los servidores necesarios (volar, ts_ls, etc.)

Verifica:
```vim
:LspInfo
```

### 3. Clipboard no funciona en WSL

**Causa**: Win32yank no instalado o configurado.

**Solución**:
```bash
# Instalar win32yank (ver sección de instalación)
curl -sLo /tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin/
```

### 4. Neo-tree muestra error "E95: Buffer already exists"

**Causa**: Bug conocido al cerrar con `:q`.

**Solución**: Ya está corregido en esta configuración. Usa `q` o `<leader>q` para cerrar Neo-tree correctamente.

### 5. Telescope no encuentra archivos

**Causa**: ripgrep o fd no instalados.

**Solución**:
```bash
sudo apt install ripgrep fd-find
ln -s $(which fdfind) ~/.local/bin/fd
```

### 6. Volar no detecta archivos Vue

**Causa**: Dependencias de Vue no instaladas.

**Solución**:
```bash
npm install -D @vue/language-server @vue/typescript-plugin
```

### 7. Copilot no funciona

**Causa**: No autenticado.

**Solución**:
```vim
:Copilot setup
```
Sigue las instrucciones para autenticarte con GitHub.

---

## 🔄 Actualizar esta Configuración

```bash
cd ~/.config/nvim
git pull origin main
```

Luego en Neovim:
```vim
:Lazy sync
```

---

## 📄 Licencia

MIT License - Libre para uso personal y comercial.

---

## 👤 Autor

Configuración creada y mantenida por **Yerko Cortés** (@yerkodigo)

---

**¡Feliz coding con Neovim! 🚀**
