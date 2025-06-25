local nvim_lsp = require("lspconfig")

nvim_lsp.tsserver.setup{} -- TypeScript/JavaScript (Node, React, Angular)
nvim_lsp.angularls.setup{} -- Angular (requiere @angular/language-server)

--npm install -g typescript typescript-language-server
--npm install -g @angular/language-server@<versión_angular>

-- Vue (Volar)
nvim_lsp.volar.setup({
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue'},
  init_options = {
    vue = {
      hybridMode = false,
    },
  },
  settings = {
    vue = {
      autoInsert = {
        attributeQuotes = true,
      },
      takeOverMode = {
        enabled = true,
      },
    }
  }
})

-- npm install -g @volar/vue-language-server
-- npm install -g typescript-language-server
