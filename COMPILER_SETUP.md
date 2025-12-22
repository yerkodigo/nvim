# Configuración de Compiladores para Neovim en Windows

Esta guía explica cómo configurar compiladores C en Windows para que plugins de Neovim puedan compilarse correctamente.

## ¿Por qué necesito un compilador?

Varios plugins de Neovim requieren compilación nativa:

- **nvim-treesitter**: Compila parsers de sintaxis escritos en C para análisis de código avanzado
- **telescope-fzf-native**: Extensión nativa en C para búsquedas ultra-rápidas
- **LuaSnip jsregexp**: Soporte de expresiones regulares JavaScript (opcional)

Sin compilador, estos plugins funcionarán con limitaciones o no se instalarán correctamente.

## Opción 1: Visual Studio Build Tools (Recomendado)

### Ventajas
- ✅ Máxima compatibilidad con todos los plugins
- ✅ Soportado oficialmente por Microsoft
- ✅ Incluye CMake, MSBuild, y nmake
- ✅ Mejor integración con Windows

### Desventajas
- ❌ Descarga grande (~7GB)
- ❌ Instalación lenta (~30 minutos)

### Instalación

#### Paso 1: Descargar Build Tools

Ir a: https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2022

Buscar: **"Build Tools for Visual Studio 2022"**

Descargar el instalador: `vs_BuildTools.exe`

#### Paso 2: Seleccionar Componentes

1. Ejecutar el instalador
2. En "Workloads", seleccionar: **"Desktop development with C++"**
3. En la pestaña "Individual components", asegurarse que están marcados:
   - ✅ **MSVC v143 - VS 2022 C++ x64/x86 build tools** (latest)
   - ✅ **Windows 11 SDK** (o Windows 10 SDK)
   - ✅ **C++ CMake tools for Windows**
   - ✅ **C++ core features**

4. Clic en "Install"
5. Esperar a que termine la instalación (~30 minutos)

#### Paso 3: Usar Developer PowerShell

**Método A: Desde el menú Start**

1. Presionar tecla Windows
2. Buscar: **"Developer PowerShell for VS 2022"**
3. Abrir esta terminal
4. Ejecutar `nvim` desde aquí

**Método B: Configurar PowerShell para activar automáticamente**

Editar tu perfil de PowerShell:

```powershell
# Editar perfil
notepad $PROFILE

# Agregar esta línea (ajustar ruta si es necesaria):
& "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\Common7\Tools\Launch-VsDevShell.ps1" -Arch amd64 -SkipAutomaticLocation

# Guardar y cerrar
# Reiniciar PowerShell
```

Ahora cada vez que abras PowerShell, tendrás acceso a las herramientas de compilación.

#### Paso 4: Verificar Instalación

```powershell
# Verificar compilador MSVC
cl

# Debería mostrar:
# Microsoft (R) C/C++ Optimizing Compiler Version XX.XX.XXXXX for x64

# Verificar CMake
cmake --version

# Debería mostrar:
# cmake version 3.XX.X

# Verificar nmake
nmake

# Debería mostrar ayuda de nmake
```

### Uso con Neovim

Una vez configurado, Neovim detectará automáticamente el compilador:

```vim
:checkhealth nvim-treesitter
```

Debería mostrar:
```
✓ C compiler: cl.exe
✓ Git: git.exe
```

## Opción 2: MinGW (Alternativa Ligera)

### Ventajas
- ✅ Instalación rápida y ligera (~1GB)
- ✅ Incluye gcc, g++, make
- ✅ Compatible con la mayoría de plugins

### Desventajas
- ❌ Puede tener problemas con algunos plugins específicos
- ❌ Menos soporte oficial que MSVC

### Instalación

```powershell
# Instalar MinGW vía Scoop
scoop install mingw

# Verificar instalación
gcc --version
g++ --version
make --version
```

### Configurar PATH (si es necesario)

```powershell
# En PowerShell como administrador
$mingwPath = "$env:USERPROFILE\scoop\apps\mingw\current\bin"

# Agregar permanentemente al PATH del usuario
[Environment]::SetEnvironmentVariable(
    "Path",
    [Environment]::GetEnvironmentVariable("Path", "User") + ";$mingwPath",
    "User"
)

# Reiniciar PowerShell
```

### Uso con Neovim

```vim
:checkhealth nvim-treesitter
```

Debería mostrar:
```
✓ C compiler: gcc
✓ Git: git.exe
```

## Opción 3: LLVM/Clang

### Instalación

```powershell
scoop install llvm

# Verificar
clang --version
```

### Notas
- Menos común para Windows
- Puede requerir configuración adicional
- No todos los plugins lo soportan bien

## Compilación Manual de Plugins

Si lazy.nvim falla en compilar automáticamente un plugin, puedes compilarlo manualmente:

### telescope-fzf-native

**Con Visual Studio Build Tools:**
```vim
" En Neovim
:Lazy build telescope-fzf-native.nvim
```

O manualmente en PowerShell:
```powershell
cd $env:LOCALAPPDATA\nvim-data\lazy\telescope-fzf-native.nvim
cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release
cmake --build build --config Release
```

**Con MinGW:**
```powershell
cd $env:LOCALAPPDATA\nvim-data\lazy\telescope-fzf-native.nvim
make
```

### nvim-treesitter

```vim
" En Neovim
:TSUpdate
:TSInstall javascript typescript vue lua
```

### LuaSnip jsregexp

**Con Visual Studio Build Tools:**
```vim
" En Neovim
:Lazy build LuaSnip
```

**Nota:** jsregexp es opcional. LuaSnip funciona sin él, solo perderás soporte de regex JavaScript.

## Troubleshooting

### Error: "cl" no se reconoce

**Problema:** Developer PowerShell no está activo.

**Solución:**
1. Abrir "Developer PowerShell for VS 2022"
2. O ejecutar el script de activación (ver Opción 1, Paso 3)

### Error: "cmake" no se reconoce

**Problema:** CMake no está instalado o no está en PATH.

**Solución:**
```powershell
# Instalar CMake
scoop install cmake

# O verificar que está en PATH de VS Build Tools
```

### Error: "cannot find -lm" o "cannot find -lpthread"

**Problema:** Intentando compilar con opciones de Linux en Windows.

**Solución:**
- Asegurarse de que los plugins usen la configuración correcta para Windows
- La configuración ya debería manejar esto automáticamente

### Treesitter falla al compilar ciertos parsers

**Problema:** Algunos parsers son más difíciles de compilar en Windows.

**Solución temporal:**
```vim
" Deshabilitar auto-instalación de parsers problemáticos
" En lua/plugins/plugins/treesitter.lua, comentar el parser problemático

" O instalar manualmente uno por uno:
:TSInstall javascript
:TSInstall typescript
```

### Build muy lento en Windows

**Problema:** Compilación en Windows es más lenta que en Linux.

**Solución:**
- Es normal, Treesitter puede tomar 5-10 minutos en la primera instalación
- Considerar deshabilitar parsers que no uses
- Usar Developer PowerShell for VS (es más rápido que MinGW)

## Comparación de Opciones

| Característica | VS Build Tools | MinGW | LLVM |
|---------------|----------------|-------|------|
| Tamaño | ~7GB | ~1GB | ~500MB |
| Velocidad instalación | Lenta | Rápida | Rápida |
| Compatibilidad | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐ |
| Compilación Treesitter | ✅ Excelente | ✅ Buena | ⚠️ Variable |
| CMake incluido | ✅ Sí | ❌ No* | ❌ No |
| Soporte oficial | ✅ Sí | ⚠️ Limitado | ⚠️ Limitado |

*CMake se instala por separado con Scoop

## Recomendaciones

### Para desarrollo profesional
→ **Visual Studio Build Tools**

Máxima compatibilidad, mejor integración con Windows, soporta todos los plugins.

### Para uso ligero/casual
→ **MinGW**

Instalación rápida, suficiente para la mayoría de casos de uso.

### Si tienes espacio limitado
→ **MinGW**

Funciona para 95% de los casos con solo 1GB.

## Verificación Final

Después de instalar cualquier opción, ejecuta en Neovim:

```vim
:checkhealth
:checkhealth nvim-treesitter
:checkhealth telescope
```

Deberías ver:
```
✓ C compiler: cl.exe (o gcc)
✓ Git: git.exe
✓ CMake: cmake.exe
```

## Scripts de Verificación

### Verificar herramientas de compilación

```powershell
# Script de verificación completa
function Test-CompilerSetup {
    Write-Host "`n=== Verificación de Compiladores ===" -ForegroundColor Cyan

    # Compilador C
    if (Get-Command cl -ErrorAction SilentlyContinue) {
        Write-Host "✓ MSVC (cl.exe)" -ForegroundColor Green
        cl 2>&1 | Select-String "Version" | Select-Object -First 1
    } elseif (Get-Command gcc -ErrorAction SilentlyContinue) {
        Write-Host "✓ GCC" -ForegroundColor Green
        gcc --version | Select-Object -First 1
    } else {
        Write-Host "✗ No se encontró compilador C" -ForegroundColor Red
        return $false
    }

    # CMake
    if (Get-Command cmake -ErrorAction SilentlyContinue) {
        Write-Host "✓ CMake" -ForegroundColor Green
        cmake --version | Select-Object -First 1
    } else {
        Write-Host "⚠ CMake no instalado (opcional)" -ForegroundColor Yellow
    }

    # Make (MinGW)
    if (Get-Command make -ErrorAction SilentlyContinue) {
        Write-Host "✓ Make" -ForegroundColor Green
    }

    # nmake (MSVC)
    if (Get-Command nmake -ErrorAction SilentlyContinue) {
        Write-Host "✓ nmake" -ForegroundColor Green
    }

    Write-Host "`n✓ Sistema listo para compilar plugins de Neovim" -ForegroundColor Green
    return $true
}

# Ejecutar verificación
Test-CompilerSetup
```

## Enlaces Útiles

- [Visual Studio Build Tools](https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2022)
- [nvim-treesitter Wiki](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support)
- [Scoop](https://scoop.sh/)
- [CMake Download](https://cmake.org/download/)

## Próximos Pasos

1. Elige una opción de compilador (recomendado: VS Build Tools)
2. Instala siguiendo los pasos de esta guía
3. Verifica con los comandos de verificación
4. Abre Neovim y ejecuta `:checkhealth`
5. Si todo está OK, los plugins se compilarán automáticamente

¡Disfruta de Neovim con todas sus funcionalidades en Windows!
