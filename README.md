# Neovim Configs 🚀

Este repositorio contiene instrucciones y documentación para configurar **Neovim** sin permisos de administrador, junto con una lista detallada de plugins esenciales para optimizar tu flujo de trabajo en Vim/Neovim.

## Instalación de Neovim sin Permisos de Administrador

1. Descarga la versión **no release** de Neovim desde su [repositorio oficial](https://github.com/neovim/neovim/releases).
2. Extrae el archivo en una carpeta donde guardas tus programas, por ejemplo: `C:\Users\MIUSUARIO\Apps\Neovim`.
3. Ejecuta el siguiente comando en **cmd** para agregar Neovim a la variable `PATH`:
    ```bash
    setx PATH "%PATH%;C:\Users\TuNombreDeUsuario\Apps\Neovim\bin"
    ```
4. Cierra y abre nuevamente **cmd**, y verifica la instalación ejecutando:
    ```bash
    nvim --version
    ```

### Configuración Básica de Neovim

1. Crea la carpeta de configuración para Neovim:
    ```bash
    mkdir %LOCALAPPDATA%\nvim
    ```
2. Crea un archivo de configuración básico (`init.vim`):
    ```bash
    echo. > %LOCALAPPDATA%\nvim\init.vim
    ```

¡Listo! Neovim está configurado. Ahora puedes personalizarlo según tus preferencias.

---

## Plugins de Neovim 🛠️

Esta es una lista de plugins utilizados en la configuración de Neovim, con una breve descripción, comandos esenciales y atajos de teclado personalizados.

### 🔍 Fuzzy Finder

- **`fzf`**: Buscador difuso para encontrar archivos rápidamente.
  - **Comando**: `:FZF` - Busca archivos en el directorio actual.

- **`fzf.vim`**: Integración de `fzf` con Vim.
  - **Comandos**:
    - `:Files` - Buscar archivos.
    - `:GFiles` - Buscar archivos en un repositorio Git.
    - `:Buffers` - Listar buffers abiertos.

### 🔄 Autocompletado y Lenguajes

- **`coc.nvim`**: Proporciona autocompletado y soporte para múltiples lenguajes.
  - **Comando**: `:CocInstall <extension>` - Instalar extensiones de lenguajes.
  - **Atajos**:
    - `Tab` - Completar sugerencias.
    - `Shift + Tab` - Revertir la sugerencia.

- **`vim-polyglot`**: Soporte para varios lenguajes de programación.
  - **Uso**: Se activa automáticamente.

### 🔧 Control de Versiones

- **`vim-gitgutter`**: Muestra cambios de Git en la columna lateral.
  - **Comandos**:
    - `]c` - Siguiente cambio.
    - `[c` - Cambio anterior.

### ✏️ Edición de Código

- **`emmet-vim`**: Expande abreviaturas HTML/CSS.
  - **Comando**: `Ctrl + Y, E` - Expande abreviaturas.

- **`vim-surround`**: Manipula pares de caracteres.
  - **Comandos**:
    - `cs"'` - Cambia comillas dobles a simples.
    - `ds"` - Elimina las comillas.

- **`vim-commentary`**: Facilita comentar/descomentar líneas.
  - **Comando**: `gcc` - Comentar o descomentar.

- **`nerdtree`**: Explorador de archivos en Neovim.
  - **Comando**: `:NERDTreeToggle` - Abrir/cerrar NERDTree.

- **`vim-closetag`**: Cierra automáticamente etiquetas HTML.

- **`auto-pairs`**: Cierra automáticamente pares de caracteres como `{}` o `[]`.

### 🧭 Navegación

- **`vim-tmux-navigator`**: Navega entre Tmux y Vim.
  - **Comandos**: `Ctrl + h/j/k/l` para navegar entre paneles.

### 🎨 Temas

- **`Mies.vim`**: Tema visual para personalizar la apariencia de Neovim.
  - **Uso**: Se activa automáticamente al cargar.

### 💬 Comentarios

- **`nerdcommenter`**: Otra opción para comentar/descomentar código.
  - **Comandos**:
    - `,cc` - Comentar.
    - `,cu` - Descomentar.

---

## Mapeos de Teclas Personalizados ⌨️

```vim
let mapleader=" "
```
- **Guardado**: `Leader + w` - Guardar archivo.
- **Cerrar**: `Leader + q` - Cerrar Neovim.
- **Copiar**: `Ctrl + c` (modo visual) - Copiar al portapapeles.
- **Formatear**: `Leader + f` - Formatear código.
- **Navegación de NERDTree**: `Leader + nt` - Abrir NERDTree.
- **Mover líneas**: `Alt + j` / `Alt + k` - Mover líneas hacia abajo/arriba.

---

¡Gracias por visitar este repositorio! ✨

---

Este `README.md` tiene una estructura más clara y organizada para que sea fácil de seguir y atractivo a la vista. Puedes ajustarlo a las necesidades de tu repositorio o agregar más secciones si lo necesitas.
