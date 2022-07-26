local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("rafaelgdaa.lsp.mason")
require("rafaelgdaa.lsp.handlers").setup()
require("rafaelgdaa.lsp.null-ls")
