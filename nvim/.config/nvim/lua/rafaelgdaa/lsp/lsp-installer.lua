local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("rafaelgdaa.lsp.handlers").on_attach,
    capabilities = require("rafaelgdaa.lsp.handlers").capabilities,
  }

  if server.name == "jsonls" then
    local jsonls_opts = require "rafaelgdaa.lsp.settings.jsonls"
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_opts = require "rafaelgdaa.lsp.settings.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server.name == "pyright" then
    local pyright_opts = require "rafaelgdaa.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server.name == "emmet_ls" then
    local emmet_ls_opts = require "rafaelgdaa.lsp.settings.emmet_ls"
    opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
  end
  
  if server.name == "solargraph" then
    local solargraph_opts = require "rafaelgdaa.lsp.settings.solargraph"
    opts = vim.tbl_deep_extend("force", solargraph_opts, opts)
  end
  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)