local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.setup = function()
	local icons = require("rafaelgdaa.icons")
	local signs = {

		{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
		{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
		{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
		{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = true,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_highlight_document(client)
	-- if client.resolved_capabilities.document_highlight then
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
	-- end
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting_sync()' ]])
	-- vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]])  -- NVIM 8.0
end

-- local function lsp_formatting(bufnr)
-- 	vim.lsp.buf.format({
-- 		filter = function(client)
-- 			-- apply whatever logic you want (in this example, we'll only use null-ls)
-- 			return client.name == "null-ls"
-- 		end,
-- 		bufnr = bufnr,
-- 	})
-- end
M.on_attach = function(client, bufnr)
	-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	-- if client.supports_method("textDocument/formatting") then
	-- 	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
	-- 	vim.api.nvim_create_autocmd("BufWritePre", {
	-- 		group = augroup,
	-- 		buffer = bufnr,
	-- 		callback = function()
	-- 			lsp_formatting(bufnr)
	-- 		end,
	-- 	})
	-- end
	-- 	-- TODO: refactor this into a method that checks if string in list
	--
	-- 	if client.name == "jdt.ls" then
	-- 		if JAVA_DAP_ACTIVE then
	-- 			require("jdtls").setup_dap({ hotcodereplace = "auto" })
	-- 			require("jdtls.dap").setup_dap_main_class_configs()
	-- 		end
	-- 		M.capabilities.textDocument.completion.completionItem.snippetSupport = false
	-- 		vim.lsp.codelens.refresh()
	-- 	else
	-- 	end
	--
	if client.name == "sumneko_lua" or "solargraph" then
		client.resolved_capabilities.document_formatting = false
	end
	local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
	if not status_cmp_ok then
		return
	end
	M.capabilities.textDocument.completion.completionItem.snippetSupport = true
	M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end

function M.enable_format_on_save()
	vim.cmd([[
    augroup format_on_save
      autocmd!
      autocmd BufWritePre * lua vim.lsp.buf.formatting()
      " autocmd BufWritePre * lua vim.lsp.buf.format({ async = true })
    augroup end
  ]])
	vim.notify("Enabled format on save")
end

function M.disable_format_on_save()
	M.remove_augroup("format_on_save")
	vim.notify("Disabled format on save")
end

function M.toggle_format_on_save()
	if vim.fn.exists("#format_on_save#BufWritePre") == 0 then
		M.enable_format_on_save()
	else
		M.disable_format_on_save()
	end
end

function M.remove_augroup(name)
	if vim.fn.exists("#" .. name) == 1 then
		vim.cmd("au! " .. name)
	end
end

vim.cmd([[ command! LspToggleAutoFormat execute 'lua require("user.lsp.handlers").toggle_format_on_save()' ]])

return M
