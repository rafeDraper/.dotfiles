local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local servers = { "solargraph", "sumneko_lua" }

require("mason-lspconfig").setup({
  ensure_installed = servers
})


for _, server in pairs(servers) do
  local opts = {
    on_attach = require("rafaelgdaa.lsp.handlers").on_attach,
		capabilities = require("rafaelgdaa.lsp.handlers").capabilities,

  }
  local has_custom_opts, server_custom_opts = pcall(require, "rafaelgdaa.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end
