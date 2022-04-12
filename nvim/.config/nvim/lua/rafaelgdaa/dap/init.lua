local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

require("rafaelgdaa.dap.dap-virtual-text")
require("rafaelgdaa.dap.dapui")
require("rafaelgdaa.dap.ultest")

vim.g.dap_virtual_text = true
dap.adapters.ruby_debug = {
	type = "executable",
	command = "bundle",
	args = { "exec", "readapt", "stdio" },
}

dap.configurations.ruby = {
	{
		type = "ruby_debug",
		request = "launch",
		name = "*** Active File",
		program = "${file}",
		programArgs = {},
		useBundler = false,
	},

	{
		type = "ruby_debug",
		request = "launch",
		name = "*** Rspec (Active File)",
		program = "bundle",
		programArgs = { "exec", "rspec", "-I", "${workspaceFolder}", "${file}" },
		useBundler = true,
	},
	{

		type = "ruby_debug",
		request = "launch",
		name = "*** Rails",
		program = "bundle",
		programArgs = { "exec", "rails", "s" },
		useBundler = true,
	},
}

-- Logic: bundle exec rspec file/name

dap.defaults.fallback.terminal_win_cmd = "80vsplit new"
vim.fn.sign_define("DapBreakpoint", { text = "💀", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "🐛", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "🎲", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "🎯", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "🚫", texthl = "", linehl = "", numhl = "" })

dap.set_log_level("ERROR")
dap.set_log_level("TRACE")
