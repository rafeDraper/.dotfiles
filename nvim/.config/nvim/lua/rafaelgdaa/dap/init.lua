local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

--require("rafaelgdaa.dap.dap-virtual-text")
--require("rafaelgdaa.dap.dapui")
--require('dap-ruby').setup()

vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
dap.set_log_level("ERROR")
dap.set_log_level("TRACE")
