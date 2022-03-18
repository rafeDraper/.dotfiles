local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

vim.fn.sign_define("DapBreakpoint", { text = "💀", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "🐛", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "🎲", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "🎯", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "🚫", texthl = "", linehl = "", numhl = "" })

dap.set_log_level("ERROR")
