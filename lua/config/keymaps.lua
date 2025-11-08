-- ============================================================================
-- KEYMAPS - Punto de entrada principal
-- ============================================================================
-- Este archivo importa todos los keymaps organizados por categoría.
-- La tecla leader se configura en lua/config/lazy.lua antes de cargar plugins.
--
-- Para ver la lista completa de keymaps, consulta:
-- lua/config/keymaps/README.md
-- ============================================================================

-- Cargar keymaps por categoría
require("config.keymaps.general")     -- Atajos generales del editor
require("config.keymaps.windows")     -- Gestión de ventanas
require("config.keymaps.tabs")        -- Gestión de pestañas
require("config.keymaps.files")       -- Operaciones con archivos
require("config.keymaps.navigation")  -- Navegación y explorador

-- Nota: Algunos keymaps adicionales están definidos en los archivos de plugins:
-- - LSP keymaps: lua/plugins/lsp/init.lua
-- - Telescope: lua/plugins/plugins/navigation/telescope.lua
-- - Auto-session: lua/plugins/plugins/tools/auto-session.lua
-- - Copilot: lua/plugins/plugins/tools/copilot.lua
-- - Colorscheme: lua/plugins/plugins/ui/colorscheme.lua
-- - Neotree: lua/plugins/plugins/navigation/neotree.lua
