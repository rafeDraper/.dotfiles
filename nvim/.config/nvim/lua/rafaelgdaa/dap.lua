local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end
local icons = require("rafaelgdaa.icons")

vim.fn.sign_define("DapBreakpoint", { text = icons.diagnostics.Breakpoint, texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = icons.diagnostics.Condition, texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = icons.diagnostics.LogPoint, texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = icons.diagnostics.Stop, texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = icons.diagnostics.Rejected, texthl = "", linehl = "", numhl = "" })

dap.adapters.ruby = function(callback, config)
	local handle
	local stdout = vim.loop.new_pipe(false)
	local pid_or_err
	local waiting = config.waiting or 500
	local args

	if config.bundle == "bundle" then
		args = { "--open", "--port", config.port, "-c", "--", "bundle", "exec", config.command, config.script }
	else
		args = { "--open", "--port", config.port, "-c", "--", config.command, config.script }
	end

	local opts = {
		stdio = { nil, stdout },
		args = { "--open", "--port", config.port, "-c", "--", config.command, config.script },
		detached = false,
	}

	handle, pid_or_err = vim.loop.spawn("rdbg", opts, function(code)
		handle:close()
		if code ~= 0 then
			print("rdbg exited with code", code)
		end
	end)

	assert(handle, "Error running rgdb: " .. tostring(pid_or_err))

	stdout:read_start(function(err, chunk)
		assert(not err, err)
		if chunk then
			vim.schedule(function()
				require("dap.repl").append(chunk)
			end)
		end
	end)

	-- Wait for rdbg to start
	vim.defer_fn(function()
		callback({ type = "server", host = config.server, port = config.port })
	end, waiting)
end

dap.configurations.ruby = {
	{
		type = "ruby",
		name = "debug current file",
		bundle = "",
		request = "attach",
		command = "ruby",
		script = "${file}",
		port = 38698,
		server = "127.0.0.1",
		waiting = 1000,
	},
	{
		type = "ruby",
		name = "run current spec file",
		bundle = "bundle",
		request = "attach",
		command = "rspec",
		script = "${file}",
		port = 38698,
		server = "127.0.0.1",
		waiting = 1000,
	},
	{
		type = "ruby",
		name = "run rspec",
		bundle = "bundle",
		request = "attach",
		command = "rspec",
		script = "./spec",
		port = 38698,
		server = "127.0.0.1",
		waiting = 1000,
	},
}
dap.defaults.fallback.force_external_terminal = true
dap.set_log_level("ERROR")
