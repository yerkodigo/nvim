local nvim_lsp = require("lspconfig")

-- TypeScript/JavaScript (Node, React, Angular)
nvim_lsp.tsserver.setup{}
-- Angular (requiere @angular/language-server)
nvim_lsp.angularls.setup{}


--npm install -g typescript typescript-language-server
--npm install -g @angular/language-server@<versión_angular>

