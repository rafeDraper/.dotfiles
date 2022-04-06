local ultest_status, ultest = pcall(require, "ultest")

if not ultest_status then
	vim.notify("Please Install 'ultest'")
	return
end

local g = vim.g
g.ultest_use_pty = 1
g.ultest_output_min_width = 120
g.ultest_output_max_height = 80

vim["test#ruby#rspec#options"] = "--color=always"

local ruby = function(cmd)
	-- The command can start with python command directly or an env manager
	local non_modules = { "rdbg" }
	-- Index of the python module to run the test.
	local module_index = 1
	if vim.tbl_contains(non_modules, cmd[1]) then
		module_index = 3
	end
	local module = cmd[module_index]

	-- Remaining elements are arguments to the module
	local args = vim.list_slice(cmd, module_index + 1)
	return {
		dap = {
			type = "ruby",
			request = "launch",
			module = module,
			args = args,
		},
	}
end

ultest.setup({
	builder = { ruby },
})
