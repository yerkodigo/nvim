# Instalación de Neovim en Windows PowerShell

Esta guía te ayudará a configurar Neovim en Windows PowerShell con todas las dependencias necesarias para que la configuración funcione correctamente.

## 1. PowerShell 7+

Se recomienda usar PowerShell 7 o superior para mejor compatibilidad.

```powershell
# Verificar versión actual
$PSVersionTable.PSVersion

# Si es menor a 7.x, instalar PowerShell 7
winget install --id Microsoft.PowerShell --source winget
```

## 2. Scoop (Gestor de Paquetes)

Scoop es un gestor de paquetes para Windows similar a apt o homebrew.

```powershell
# En PowerShell como administrador
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

# Instalar Scoop
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# Agregar buckets útiles
scoop bucket add extras
scoop bucket add nerd-fonts
```

## 3. Dependencias Obligatorias

```powershell
# Git (para clonar plugins y lazy.nvim)
scoop install git

# Neovim
scoop install neovim

# Ripgrep (para búsqueda de contenido con Telescope)
scoop install ripgrep

# fd (para búsqueda de archivos con Telescope)
scoop install fd

# Node.js (para LSP servers y formatters)
scoop install nodejs

# CMake (para compilar telescope-fzf-native)
scoop install cmake
```

## 4. Compilador C (Elegir una opción)

Algunos plugins requieren compilación nativa (Treesitter, telescope-fzf-native, etc.).

### Opción A: Visual Studio Build Tools (Recomendado)

**Ventajas:** Máxima compatibilidad, soportado oficialmente por Microsoft
**Desventajas:** Descarga grande (~7GB)

1. Descargar desde: https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2022
2. Ejecutar el instalador
3. Seleccionar: **"Desktop development with C++"**
4. Componentes necesarios:
   - MSVC v143 - VS 2022 C++ x64/x86 build tools
   - Windows 11 SDK (o Windows 10 SDK)
   - C++ CMake tools for Windows

5. Después de instalar, usar "Developer PowerShell for VS 2022" desde el menú Inicio

### Opción B: MinGW (Alternativa ligera)

**Ventajas:** Ligero (~1GB), instalación rápida
**Desventajas:** Puede tener problemas de compatibilidad con algunos plugins

```powershell
scoop install mingw

# Verificar instalación
gcc --version
make --version
```

### Opción C: LLVM/Clang

```powershell
scoop install llvm

# Verificar instalación
clang --version
```

## 5. Formatters y Linters

### JavaScript/TypeScript/Vue
```powershell
npm install -g prettier
npm install -g eslint_d  # Más rápido que eslint
# O alternativamente
npm install -g eslint
```

### Lua
Stylua se instala automáticamente vía Mason, pero también puedes instalarlo manualmente:
```powershell
scoop install stylua
```

### Python (Opcional - si desarrollas en Python)
```powershell
scoop install python

# Instalar herramientas de Python
pip install black isort pylint
```

## 6. Nerd Font (Para iconos correctos)

Los iconos en Neovim requieren una Nerd Font instalada.

```powershell
# Instalar JetBrainsMono Nerd Font (recomendado)
scoop install JetBrainsMono-NF

# O FiraCode Nerd Font
scoop install FiraCode-NF

# O CascadiaCode Nerd Font
scoop install CascadiaCode-NF
```

Después de instalar, configura la fuente en tu terminal:
- **Windows Terminal:** Configuración → Perfiles → Apariencia → Tipo de letra
- **Alacritty:** Editar `alacritty.yml` → `font.normal.family`
- **WezTerm:** Editar `wezterm.lua` → `config.font`

## 7. Clipboard Provider (Opcional)

Neovim en Windows usa el clipboard nativo, pero win32yank ofrece mejor rendimiento:

```powershell
scoop install win32yank
```

## 8. Verificación de Instalación

Ejecuta este script para verificar que todo está instalado:

```powershell
@("git", "nvim", "rg", "fd", "node", "npm", "cmake", "prettier", "eslint_d") | ForEach-Object {
  $cmd = $_
  if (Get-Command $cmd -ErrorAction SilentlyContinue) {
    Write-Host "$cmd : ✓ Instalado" -ForegroundColor Green
  } else {
    Write-Host "$cmd : ✗ NO instalado" -ForegroundColor Red
  }
}

# Verificar compilador C
if (Get-Command cl -ErrorAction SilentlyContinue) {
  Write-Host "Compilador C (MSVC) : ✓ Instalado" -ForegroundColor Green
} elseif (Get-Command gcc -ErrorAction SilentlyContinue) {
  Write-Host "Compilador C (GCC) : ✓ Instalado" -ForegroundColor Green
} else {
  Write-Host "Compilador C : ✗ NO instalado" -ForegroundColor Yellow
  Write-Host "  Los parsers de Treesitter no se compilarán automáticamente" -ForegroundColor Yellow
}
```

## 9. Primera Ejecución de Neovim

```powershell
# Abrir Neovim (lazy.nvim se instalará automáticamente)
nvim
```

En la primera ejecución:
1. **lazy.nvim** se clonará automáticamente
2. Todos los **plugins** se instalarán automáticamente
3. **Treesitter** empezará a compilar parsers (puede tomar unos minutos)
4. **Mason** instalará LSP servers según los archivos que abras

### Comandos útiles en Neovim

```vim
:checkhealth              " Verificar estado de la configuración
:checkhealth telescope    " Verificar Telescope específicamente
:checkhealth nvim-treesitter  " Verificar Treesitter

:Lazy                     " Gestionar plugins
:Lazy sync                " Sincronizar todos los plugins
:Lazy build telescope-fzf-native.nvim  " Compilar fzf manualmente

:Mason                    " Gestionar LSP servers y herramientas
:MasonUpdate              " Actualizar herramientas instaladas

:TSUpdate                 " Actualizar todos los parsers de Treesitter
:TSInstall javascript     " Instalar parser específico
```

## 10. Solución de Problemas Comunes

### Error: "no C compiler found"

**Problema:** Treesitter o plugins nativos no pueden compilarse.

**Solución:**
1. Instalar Visual Studio Build Tools o MinGW (ver sección 4)
2. Si instalaste VS Build Tools, abrir "Developer PowerShell for VS 2022"
3. Ejecutar `nvim` desde esa consola

### Error: telescope-fzf-native no compila

**Problema:** CMake no encuentra compilador o falla la compilación.

**Solución:**
```powershell
# Verificar que CMake está instalado
cmake --version

# Si no está, instalarlo
scoop install cmake

# Compilar manualmente desde Neovim
:Lazy build telescope-fzf-native.nvim
```

**Nota:** Telescope funciona sin fzf-native, solo será más lento en proyectos grandes.

### Error: Treesitter no compila parsers

**Problema:** No hay compilador C disponible.

**Soluciones:**
1. Instalar compilador C (ver sección 4)
2. Usar Developer PowerShell for VS 2022
3. Instalar parsers manualmente: `:TSInstall javascript typescript vue`

### Clipboard no funciona

**Problema:** Copiar/pegar entre Neovim y Windows no funciona.

**Solución:**
```powershell
# Instalar win32yank
scoop install win32yank

# Verificar en Neovim
:checkhealth clipboard
```

### Iconos no se ven correctamente

**Problema:** Aparecen cuadrados o símbolos raros en lugar de iconos.

**Solución:**
1. Instalar una Nerd Font (ver sección 6)
2. Configurar la fuente en tu terminal
3. Reiniciar la terminal

### Error: "git" no se reconoce

**Problema:** Git no está en el PATH.

**Solución:**
```powershell
# Instalar git
scoop install git

# Reiniciar PowerShell
```

### LSP no funciona para JavaScript/TypeScript

**Problema:** No hay servidor LSP instalado.

**Solución:**
```vim
" En Neovim
:Mason

" Buscar e instalar:
" - typescript-language-server
" - vue-language-server (para Vue 3)
" - eslint-lsp
```

## 11. Alternativas a Scoop

Si Scoop no funciona, puedes usar otros gestores de paquetes:

### Chocolatey

```powershell
# Instalar Chocolatey (como administrador)
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Instalar dependencias
choco install git neovim ripgrep fd nodejs cmake mingw -y
```

### Winget (Windows 11)

```powershell
winget install Git.Git
winget install Neovim.Neovim
winget install BurntSushi.ripgrep.MSVC
winget install sharkdp.fd
winget install OpenJS.NodeJS
winget install Kitware.CMake
```

## 12. Configuración del Perfil de PowerShell (Opcional)

Agrega estos alias a tu perfil de PowerShell para mayor comodidad:

```powershell
# Editar perfil
notepad $PROFILE

# Agregar estas líneas:
Set-Alias -Name vim -Value nvim
Set-Alias -Name vi -Value nvim

# Si usas Visual Studio Build Tools, activar automáticamente:
# & "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\Launch-VsDevShell.ps1" -Arch amd64 -SkipAutomaticLocation

# Guardar y recargar
. $PROFILE
```

## 13. Resumen de Comandos de Instalación Rápida

```powershell
# Instalación completa en un solo bloque
# (Ejecutar en PowerShell como administrador)

# Instalar Scoop
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex

# Agregar buckets
scoop bucket add extras
scoop bucket add nerd-fonts

# Instalar dependencias obligatorias
scoop install git neovim ripgrep fd nodejs cmake

# Compilador (elegir uno)
scoop install mingw  # Opción ligera

# Formatters
npm install -g prettier eslint_d

# Python (opcional)
scoop install python
pip install black isort pylint

# Fuente con iconos
scoop install JetBrainsMono-NF

# Clipboard mejorado (opcional)
scoop install win32yank

# Primera ejecución
nvim
```

## 14. Próximos Pasos

1. Abre Neovim y deja que se instalen los plugins: `nvim`
2. Ejecuta `:checkhealth` para verificar todo
3. Instala LSP servers con `:Mason`
4. Lee la documentación de compiladores: `COMPILER_SETUP.md`
5. Personaliza tu configuración según necesites

¡Disfruta de Neovim en Windows PowerShell!
