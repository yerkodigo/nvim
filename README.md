# Neovim configs

Para instalar Neovim sin permisos de administrador se debe descargar la version no release de Neo vim en su repo https://github.com/neovim/neovim/releases/
Luego extraer el archivo en la ruta donde tenemos nuestros programas por ejemplo C:\Users\MIUSUARIO\Apps\Neovim
Luego ejecutar el siguiente comando en cmd:
```
setx PATH "%PATH%;C:\Users\TuNombreDeUsuario\Apps\Neovim\bin"
```
Cerrar y abrir el cmd para ver si los cambios surgieron efecto ejecutando el comando
```
nvim --version
```
LISTO

-- Working in the documentation 👷 --

En el directorio raiz se debe crear un archivo .vimrc en donde tenga el siguiente contenido:
```
so $HOME/nvim/.vimrc
```
# Documentación de Plugins de Vim

Esta es una lista de plugins utilizados en la configuración de Vim, junto con una breve descripción, comandos esenciales para su uso y mapeos de teclas personalizados.

## Fuzzy Finder

### `fzf`
- **Descripción**: Un buscador difuso que permite encontrar archivos y contenido rápidamente.
- **Comando**: `:FZF` - Abre el buscador difuso para buscar archivos en el directorio actual.

### `fzf.vim`
- **Descripción**: Integración de `fzf` con Vim.
- **Comandos útiles**:
  - `:Files` - Busca archivos en el directorio actual.
  - `:GFiles` - Busca archivos en el repositorio Git.
  - `:Buffers` - Muestra una lista de buffers abiertos.

## Autocompletado y Lenguajes

### `coc.nvim`
- **Descripción**: Proporciona autocompletado y soporte para múltiples lenguajes.
- **Comando**: `:CocInstall <extension>` - Instala extensiones para diferentes lenguajes.
- **Atajos**:
  - `Tab` - Completar la sugerencia.
  - `Shift + Tab` - Revertir la sugerencia.

### `vim-polyglot`
- **Descripción**: Soporte para múltiples lenguajes de programación.
- **Uso**: Se activa automáticamente al abrir archivos de diferentes lenguajes.

## Control de Versiones

### `vim-gitgutter`
- **Descripción**: Muestra indicadores de cambios en Git en la columna de la izquierda.
- **Comandos**:
  - `]c` - Ir al siguiente cambio.
  - `[c` - Ir al cambio anterior.

## Edición de Código

### `emmet-vim`
- **Descripción**: Expansión de abreviaturas HTML/CSS.
- **Comando**: Escribe una abreviatura y presiona `Ctrl + Y, E` para expandir.

### `vim-surround`
- **Descripción**: Manejo de pares de caracteres (comillas, paréntesis, etc.).
- **Comandos**:
  - `cs"'` - Cambia el entorno de comillas dobles a simples.
  - `ds"` - Elimina las comillas alrededor de la palabra.

### `vim-commentary`
- **Descripción**: Facilita la creación y eliminación de comentarios.
- **Comando**: `gcc` - Comentar o descomentar la línea actual.

### `nerdtree`
- **Descripción**: Explorador de archivos.
- **Comandos**:
  - `:NERDTreeToggle` - Abre o cierra NERDTree.
  - `o` - Abre el archivo seleccionado.

### `indentLine`
- **Descripción**: Muestra líneas de indentación.
- **Uso**: Se activa automáticamente al abrir archivos.

### `vim-closetag`
- **Descripción**: Cierra automáticamente las etiquetas HTML.
- **Uso**: Al escribir `<div>`, se completará automáticamente a `<div></div>`.

### `auto-pairs`
- **Descripción**: Cierra automáticamente los pares de caracteres.
- **Uso**: Al escribir `{`, se completará automáticamente a `{}`.

## Navegación

### `vim-tmux-navigator`
- **Descripción**: Permite navegar entre Vim y Tmux.
- **Comandos**:
  - `Ctrl + h/j/k/l` - Navega entre paneles de Tmux y ventanas de Vim.

## Temas

### `Mies.vim`
- **Descripción**: Un tema para personalizar la apariencia de Vim.
- **Uso**: Se activa automáticamente al cargar Vim.

## Comentarios

### `nerdcommenter`
- **Descripción**: Alternativa a `vim-commentary` para comentar código.
- **Comandos**:
  - `,cc` - Comentar la línea actual.
  - `,cu` - Descomentar la línea actual.

## Mapeo de Teclas

### Configuración de Mapeo
```vim
let mapleader=" "
Comandos Personalizados
Leader + w - Guardar el archivo actual.
Leader + q - Cerrar Vim.
Ctrl + c (en modo visual) - Copiar la selección al portapapeles (requiere xclip en Linux).
Leader + ; - Insertar un ; al final de la línea actual.
Leader + / - Limpiar la búsqueda actual.
Leader + f - Formatear todo el código desde la posición actual.
Leader + F - Formatear el código actual.
Leader + rn - Alternar entre números de línea relativos y absolutos.
Leader + pp - Alternar entre el modo de revisión de ortografía.
Leader + z - Ir al final de la pantalla.
Ctrl + p - Copiar la ruta completa del archivo actual al portapapeles.
Leader + nt - Abrir NERDTree en la ruta actual.
Alt + j - Mover la línea actual hacia abajo.
Alt + k - Mover la línea actual hacia arriba.
```
