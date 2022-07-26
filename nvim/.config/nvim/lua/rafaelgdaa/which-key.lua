local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

which_key.setup({
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operaor
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "none", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
})
which_key.register({
	d = {
		name = "Debug",
		s = {
			name = "Step",
			c = { "<cmd>lua require('dap').continue()<CR>", "Continue" },
			v = { "<cmd>lua require('dap').step_over()<CR>", "Step Over" },
			i = { "<cmd>lua require('dap').step_into()<CR>", "Step Into" },
			o = { "<cmd>lua require('dap').step_out()<CR>", "Step Out" },
		},
		h = {
			name = "Hover",
			h = { "<cmd>lua require('dap.ui.variables').hover()<CR>", "Hover" },
			v = { "<cmd>lua require('dap.ui.variables').visual_hover()<CR>", "Visual Hover" },
		},
		u = {
			name = "UI",
			h = { "<cmd>lua require('dap.ui.widgets').hover()<CR>", "Hover" },
			f = { "local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>", "Float" },
		},
		r = {
			name = "Repl",
			o = { "<cmd>lua require('dap').repl.open()<CR>", "Open" },
			l = { "<cmd>lua require('dap').repl.run_last()<CR>", "Run Last" },
		},
		b = {
			name = "Breakpoints",
			c = {
				"<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
				"Breakpoint Condition",
			},
			m = {
				"<cmd>lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>",
				"Log Point Message",
			},
			t = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Create" },
		},
		c = { "<cmd>lua require('dap').scopes()<CR>", "Scopes" },
		i = { "<cmd>lua require('dap').toggle()<CR>", "Toggle" },
	},
	f = {
		name = "Format", -- optional group name
		f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" }, -- additional options for creating the keymap
		n = { "New File" }, -- just a label. don't create any mapping
		e = "Edit File", -- same as above
		["1"] = "which_key_ignore", -- special label to hide it in the popup
	},
  m = {
    name = "Mason",
    m = { "<cmd>Mason<CR>"}
  },
	t = {
		name = "Testing", -- optional group name
	},
	c = {
		name = "Comments", -- optional group name
	},
	p = {
		name = "Telescope", -- optional group name
	},
}, { prefix = "<leader>" })
