local status_ok, indent = pcall(require, "indent_blankline")
if not status_ok then
	return
end

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

indent.setup({
	show_end_of_line = true,
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
	filetype_exclude = { "dashboard" },
})
