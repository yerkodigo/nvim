# Instrucciones de configuración para LSP Servers

## Servidores LSP necesarios para tu stack de desarrollo

Después de las correcciones aplicadas, necesitas instalar los siguientes LSP servers usando Mason:

### 1. Instalar servidores LSP mediante Mason

Abre Neovim y ejecuta:

```vim
:Mason
```

Dentro de Mason, instala los siguientes servidores (presiona `i` para instalar):

#### Esenciales para tu stack:
- **volar** - Vue Language Server (Vue.js 3 oficial)
- **typescript-language-server** (ts_ls) - TypeScript/JavaScript
- **html-lsp** - HTML
- **css-lsp** (cssls) - CSS/SCSS/Less
- **eslint-lsp** - ESLint
- **json-lsp** (jsonls) - JSON

#### Formatters y Linters:
- **prettier** - Formateador para JS/TS/Vue/HTML/CSS
- **eslint_d** (opcional, más rápido que eslint) - Linter para JS/TS/Vue

### 2. Dependencias de Node.js

Asegúrate de tener instaladas las dependencias necesarias en tu proyecto:

```bash
npm install -D @vue/language-server @vue/typescript-plugin
```

O si usas yarn:

```bash
yarn add -D @vue/language-server @vue/typescript-plugin
```

### 3. Configuración del workspace de TypeScript para Vue

Si usas TypeScript con Vue.js 3, crea o actualiza tu `tsconfig.json`:

```json
{
  "compilerOptions": {
    "target": "ES2020",
    "module": "ESNext",
    "moduleResolution": "bundler",
    "strict": true,
    "jsx": "preserve",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "esModuleInterop": true,
    "lib": ["ES2020", "DOM", "DOM.Iterable"],
    "skipLibCheck": true,
    "noEmit": true
  },
  "include": ["src/**/*.ts", "src/**/*.d.ts", "src/**/*.tsx", "src/**/*.vue"],
  "exclude": ["node_modules"]
}
```

### 4. Verificación

Después de instalar todo, reinicia Neovim y abre un archivo `.vue`. Verifica que el LSP esté funcionando:

```vim
:LspInfo
```

Deberías ver `volar` y `ts_ls` adjuntos al buffer.

### 5. Comandos útiles

- `:Mason` - Abrir Mason para gestionar LSP servers
- `:LspInfo` - Ver información de LSP activos
- `:LspRestart` - Reiniciar LSP servers
- `<leader>cm` - Abrir Mason (keymap configurado)

## Notas importantes

1. **Volar vs vue_ls**: Hemos configurado Volar (el LSP oficial de Vue 3) en lugar de vue_ls/Vetur que es legacy.

2. **Integración TypeScript**: Volar funciona mejor cuando se integra con TypeScript, incluso si escribes JavaScript puro.

3. **ESLint**: Si tienes problemas con ESLint, asegúrate de tener un archivo `.eslintrc.*` en tu proyecto.

4. **Prettier**: La configuración incluye formateo automático al guardar. Si no lo deseas, comenta `format_on_save` en `formatting.lua:24-27`.
