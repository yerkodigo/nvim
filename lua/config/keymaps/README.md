# Keymaps - Referencia Rápida

Esta carpeta contiene todos los keymaps (atajos de teclado) organizados por categoría.

## 📁 Estructura

```
keymaps/
├── general.lua      - Atajos generales del editor
├── windows.lua      - Gestión de ventanas (splits, resize)
├── tabs.lua         - Gestión de pestañas
├── files.lua        - Operaciones con archivos (guardar, cerrar)
├── navigation.lua   - Navegación y explorador de archivos
└── README.md        - Este archivo
```

## ⌨️ Keymaps por Categoría

### General (general.lua)
| Modo | Atajo | Acción |
|------|-------|--------|
| i | `jk` | Salir de modo insert |
| n | `<leader>nh` | Limpiar resaltado de búsqueda |
| v | `<C-c>` | Copiar al portapapeles del sistema |
| n | `<leader>f` | Reconfigurar filetype y formatear archivo |
| n | `<leader>F` | Indentación alrededor del cursor |
| n | `<leader>yp` | Copiar ruta del archivo al portapapeles |

### Window Management (windows.lua)
| Modo | Atajo | Acción |
|------|-------|--------|
| n | `<leader>sv` | Split vertical |
| n | `<leader>sh` | Split horizontal |
| n | `<leader>se` | Splits de igual tamaño |
| n | `<leader>sx` | Cerrar split actual |
| n | `<C-M-h>` | Reducir ancho de ventana |
| n | `<C-M-l>` | Aumentar ancho de ventana |
| n | `<C-M-j>` | Reducir altura de ventana |
| n | `<C-M-k>` | Aumentar altura de ventana |
| n | `<leader>=` | Restaurar dimensiones de ventanas |

### Tabs (tabs.lua)
| Modo | Atajo | Acción |
|------|-------|--------|
| n | `<C-n>` | Abrir nueva pestaña |
| n | `<A-l>` | Siguiente pestaña |
| n | `<A-h>` | Pestaña anterior |

### Files (files.lua)
| Modo | Atajo | Acción |
|------|-------|--------|
| n | `<leader>w` | Guardar archivo |
| n | `<C-s>` | Guardar archivo |
| n | `<leader>q` | Cerrar ventana/tab |
| n | `<leader> q` | Guardar todo y cerrar |

### Navigation (navigation.lua)
| Modo | Atajo | Acción |
|------|-------|--------|
| n | `<leader>nt` | Toggle Neotree |

### LSP (definidos en plugins/lsp/init.lua)
| Modo | Atajo | Acción |
|------|-------|--------|
| n | `gd` | Ir a definición |
| n | `gr` | Referencias |
| n | `gI` | Ir a implementación |
| n | `gy` | Ir a tipo |
| n | `gD` | Ir a declaración |
| n | `K` | Hover (documentación) |
| n | `gK` | Signature help |
| i | `<C-k>` | Signature help |
| n/v | `<leader>ca` | Code action |
| n | `<leader>rn` | Renombrar |

### Telescope (definidos en plugins/plugins/navigation/telescope.lua)
| Modo | Atajo | Acción |
|------|-------|--------|
| n | `<leader>p` | Buscar archivos |
| n | `<leader>fr` | Archivos recientes |
| n | `<leader>ag` | Buscar texto (live grep) |
| n | `<leader>fc` | Buscar palabra bajo cursor |
| n | `<leader>ft` | Buscar TODOs |
| n | `<leader>gs` | Git status |

### Auto-session (definidos en plugins/plugins/tools/auto-session.lua)
| Modo | Atajo | Acción |
|------|-------|--------|
| n | `<leader>ws` | Guardar sesión |
| n | `<leader>wr` | Restaurar sesión |

### Copilot (definidos en plugins/plugins/tools/copilot.lua)
| Modo | Atajo | Acción |
|------|-------|--------|
| i | `<S-Tab>` | Aceptar sugerencia |
| i | `<C-j>` | Siguiente sugerencia |
| i | `<C-k>` | Sugerencia anterior |
| i | `<C-l>` | Trigger sugerencia |
| i | `<C-h>` | Aceptar sugerencia (alternativo) |

### Colorscheme (definidos en plugins/plugins/ui/colorscheme.lua)
| Modo | Atajo | Acción |
|------|-------|--------|
| n | `<leader>dt` | Tema oscuro (Tron) |
| n | `<leader>lt` | Tema claro (Flynn) |

## 🎯 Leader Key

La tecla leader está configurada como **Espacio** (`<Space>`).

Para ver todos los keymaps disponibles en tiempo real, presiona `<leader>` y espera un momento. El plugin **which-key** mostrará una ayuda visual.

## 📝 Notas

- Algunos keymaps están definidos directamente en los archivos de plugins para aprovechar el lazy loading de Lazy.nvim
- Los keymaps LSP solo están disponibles cuando un servidor LSP está activo en el buffer
- Los keymaps de plugins solo están disponibles cuando el plugin correspondiente está cargado

## 🔧 Modificar Keymaps

Para modificar un keymap:
1. Identifica en qué categoría está
2. Edita el archivo correspondiente
3. Reinicia Neovim o ejecuta `:source %`

Para agregar un nuevo keymap:
1. Decide en qué categoría pertenece
2. Agrégalo en el archivo correspondiente siguiendo el formato:
```lua
keymap.set("modo", "atajo", "comando", { desc = "Descripción" })
```
