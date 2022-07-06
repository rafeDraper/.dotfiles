vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "DiffChange", timeout = 200 })
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
			vim.cmd("quit")
		end
	end,
})

-- vim.api.nvim_create_autocmd({ "FileType" }, {
-- 	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
-- 	callback = function()
-- 		vim.cmd([[
--       nnoremap <silent> <buffer> q :close<CR>
--       set nobuflisted
--     ]])
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd({ "FileType" }, {
-- 	pattern = { "gitcommit", "markdown" },
-- 	callback = function()
-- 		vim.opt_local.wrap = true
-- 		vim.opt_local.spell = true
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd({ "FileType" }, {
-- 	pattern = { "lir" },
-- 	callback = function()
-- 		vim.opt_local.number = false
-- 		vim.opt_local.relativenumber = false
-- 	end,
-- })
--
--
-- vim.api.nvim_create_autocmd({ "VimResized" }, {
-- 	callback = function()
-- 		vim.cmd("tabdo wincmd =")
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
-- 	callback = function()
-- 		vim.cmd("quit")
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
-- 	callback = function()
-- 		vim.cmd("set formatoptions-=cro")
-- 	end,
-- })
--
--
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
-- 	pattern = { "*.ruby" },
-- 	callback = function()
-- 		vim.lsp.codelens.refresh()
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd({ "VimEnter" }, {
-- 	callback = function()
-- 		vim.cmd("hi link illuminatedWord LspReferenceText")
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd('BufWinEnter', {
--   pattern = '*',
--   callback = function()
--     if vim.bo.filetype == 'NvimTree' then
--       require'bufferline.state'.set_offset(31, 'FileTree')
--     end
--   end
-- })
--
-- vim.api.nvim_create_autocmd('BufWinLeave', {
--   pattern = '*',
--   callback = function()
--     if vim.fn.expand('<afile>'):match('NvimTree') then
--       require'bufferline.state'.set_offset(0)
--     end
--   end
-- })
