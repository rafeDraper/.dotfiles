local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local codeactions = null_ls.builtins.code_actions

-- local conditional = function(fn)
-- 	local utils = require("null-ls.utils").make_conditional_utils()
-- 	return fn(utils)
-- end

-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- npm install --save-dev prettier prettier-plugin-solidity
null_ls.setup({
	debug = false,
	sources = {
		formatting.rubocop,
		formatting.prettier,
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		formatting.gofmt,
		formatting.terraform_fmt,
		diagnostics.eslint,
		diagnostics.ansiblelint,
		diagnostics.yamllint,
		diagnostics.flake8,
		diagnostics.golangci_lint,
		codeactions.refactoring,
	},
})
