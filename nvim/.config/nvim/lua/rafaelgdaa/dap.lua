local dap, dapui = require("dap"), require("dapui")


local icons = require "rafaelgdaa.icons"

vim.fn.sign_define("DapBreakpoint", { text = icons.kind.Event, texthl = "", linehl = "", numhl = "" })

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.configurations.ruby = {
	{
		type = "ruby",
		request = "launch",
		name = "Rails",
		program = "bundle",
		programArgs = { "exec", "rails", "s" },
		useBundler = true,
	},
}

-- dap.defaults.fallback.terminal_win_cmd = '50vsplit new'
dap.defaults.fallback.focus_terminal = true
dap.set_log_level("ERROR")
