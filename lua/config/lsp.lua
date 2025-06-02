local nvim_lsp = require("lspconfig")

-- TypeScript/JavaScript (Node, React, Angular)
nvim_lsp.tsserver.setup{}
-- Angular (requiere @angular/language-server)
nvim_lsp.angularls.setup{}

-- Vue (Volar) setup
lspconfig.volar.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {'vue'},
  -- Descomenta para TypeScript en el futuro:
  -- init_options = {
  --   typescript = {
  --     tsdk = '/ruta/a/node_modules/typescript/lib'
  --   }
  -- }
})

--npm install -g typescript typescript-language-server
--npm install -g @angular/language-server@<versión_angular>

