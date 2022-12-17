local status, lsp = pcall(require, "lsp-zero")

if (not status) then
  print("lsp-zero is not installed")
  return
end

lsp.ensure_installed({
  "tsserver",
  "eslint",
  "sumneko_lua",
})

lsp.preset("recommended")
lsp.setup()
