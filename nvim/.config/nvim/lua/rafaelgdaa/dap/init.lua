local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

-- Dap Ruby configuration
-- local dap_ruby = require("dap-ruby")
-- dap_ruby.setup()

dap.defaults.fallback.terminal_win_cmd = "80vsplit new"
vim.fn.sign_define("DapBreakpoint", { text = "💀", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "🐛", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "🎲", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "🎯", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "🚫", texthl = "", linehl = "", numhl = "" })

vim.g.dap_virtual_text = true
dap.set_log_level("ERROR")
dap.set_log_level("TRACE")

