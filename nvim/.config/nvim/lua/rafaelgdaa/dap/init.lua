local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

require("rafaelgdaa.dap.dap-install")
require("rafaelgdaa.dap.dap-virtual-text")
require("rafaelgdaa.dap.dapui")
require("rafaelgdaa.dap.ultest")

vim.g.dap_virtual_text = true
-- Dap Ruby configuration
local dap_ruby = require("dap-ruby")
dap_ruby.setup()

dap.defaults.fallback.terminal_win_cmd = "80vsplit new"
vim.fn.sign_define("DapBreakpoint", { text = "💀", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "🐛", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "🎲", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "🎯", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "🚫", texthl = "", linehl = "", numhl = "" })

dap.set_log_level("ERROR")
dap.set_log_level("TRACE")
