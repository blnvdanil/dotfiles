local lsp = require("lsp-zero")

require('lean').setup{
  abbreviations = { builtin = true },
  lsp = { on_attach = lsp.on_attch},
  lsp3 = { on_attach = lsp.on_attach},
  mappings = true,
}
