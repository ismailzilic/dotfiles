local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

-- Java DAP config is handled by plugins/jdtls.lua

-- C/C++ debug adapter
dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-dap",
	name = "lldb",
}

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
	},
}

dap.configurations.c = dap.configurations.cpp

-- Kotlin debug adapter (Mason)
dap.adapters.kotlin = {
	type = "server",
	port = "${port}",
	executable = {
		command = vim.fn.stdpath("data") .. "/mason/bin/kotlin-debug-adapter",
		args = { "--port", "${port}" },
	},
}

dap.configurations.kotlin = {
	{
		name = "Debug Android App",
		type = "kotlin",
		request = "launch",
		projectRoot = vim.fn.getcwd(),
		mainClass = "",
		androidPackage = "",
		androidActivity = "",
	},
	{
		name = "Debug Kotlin File",
		type = "kotlin",
		request = "launch",
		projectRoot = vim.fn.getcwd(),
		mainClass = function()
			return vim.fn.input("Main class: ", "", "file")
		end,
	},
}

dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step over" })
vim.keymap.set("n", "<leader>dn", dap.step_out, { desc = "Step out" })
vim.keymap.set("n", "<leader>dm", dap.step_back, { desc = "Step back" })
vim.keymap.set("n", "<leader>drr", dap.restart, { desc = "Restart debugging" })

vim.keymap.set("n", "<leader>?", function()
	dapui.eval(nil, { enter = true })
end, { desc = "Eval var under cursor" })
