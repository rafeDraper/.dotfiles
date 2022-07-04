local status_ok, neotest = pcall(require, "neotest")

if not status_ok then
	return
end

vim.g.cursorhold_updatetime = 200
print(vim.g.cursorhold_updatetime == 200)
-- hi default UltestPass ctermfg=Green guifg=#96F291
-- hi default UltestFail ctermfg=Red guifg=#F70067
-- hi default UltestRunning ctermfg=Yellow guifg=#FFEC63
-- hi default UltestDefault ctermfg=Grey guifg=#8B8B8B
-- hi default UltestBorder ctermfg=Red guifg=#F70067
-- hi default UltestSummaryInfo ctermfg=cyan guifg=#00F1F5
-- hi default link UltestSummaryFile UltestSummaryInfo
-- hi default link UltestSummaryNamespace UltestSummaryInfo
neotest.setup({
	adapters = {
		require("neotest-rspec"),
	},
	diagnostic = {
		enabled = true,
	},
	discovery = {
		enabled = true,
	},
	floating = {
		border = "rounded",
		max_height = 0.6,
		max_width = 0.6,
		options = {},
	},
	highlights = {
		adapter_name = "NeotestAdapterName",
		border = "NeotestBorder",
		dir = "NeotestDir",
		expand_marker = "NeotestExpandMarker",
		failed = "NeotestFailed",
		file = "NeotestFile",
		focused = "NeotestFocused",
		indent = "NeotestIndent",
		namespace = "NeotestNamespace",
		passed = "NeotestPassed",
		running = "NeotestRunning",
		skipped = "NeotestSkipped",
		test = "NeotestTest",
	},
	icons = {
		child_indent = "│",
		child_prefix = "├",
		collapsed = "─",
		expanded = "╮",
		failed = "✖",
		final_child_indent = " ",
		final_child_prefix = "╰",
		non_collapsible = "─",
		passed = "😎",
		running = "🗘",
		skipped = "ﰸ",
		unknown = "?",
	},
	jump = {
		enabled = true,
	},
	output = {
		enabled = true,
		open_on_run = true,
	},
	run = {
		enabled = true,
	},
	status = {
		enabled = true,
	},
	strategies = {
		integrated = {
			height = 40,
			width = 120,
		},
	},
	summary = {
		enabled = true,
		expand_errors = true,
		follow = true,
		mappings = {
			attach = "a",
			expand = { "<CR>", "<2-LeftMouse>" },
			expand_all = "e",
			jumpto = "i",
			output = "o",
			run = "r",
			short = "O",
			stop = "u",
		},
	},
})
