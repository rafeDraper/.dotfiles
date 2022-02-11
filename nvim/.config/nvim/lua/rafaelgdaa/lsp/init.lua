local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "rafaelgdaa.lsp.lsp-signature"
require "rafaelgdaa.lsp.lsp-installer"
require("rafaelgdaa.lsp.handlers").setup()
require "rafaelgdaa.lsp.null-ls"
