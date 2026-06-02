return {
	name = "nvim-dap",
	dir = "$DAP_DIR",
	build = false,
	keys = {
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
			desc = "DAP continue",
		},
		{
			"<F10>",
			function()
				require("dap").step_over()
			end,
			desc = "DAP step over",
		},
		{
			"<F11>",
			function()
				require("dap").step_into()
			end,
			desc = "DAP step into",
		},
		{
			"<F12>",
			function()
				require("dap").step_out()
			end,
			desc = "DAP step out",
		},
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle breakpoint",
		},
		{
			"<leader>dB",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "Conditional breakpoint",
		},
		{
			"<leader>dr",
			function()
				require("dap").repl.open()
			end,
			desc = "DAP REPL",
		},
		{
			"<leader>dl",
			function()
				require("dap").run_last()
			end,
			desc = "DAP run last",
		},
	},
	config = function()
		vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "◆", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
		)
		vim.fn.sign_define(
			"DapBreakpointRejected",
			{ text = "○", texthl = "DapBreakpointRejected", linehl = "", numhl = "" }
		)
		vim.fn.sign_define("DapLogPoint", { text = "◉", texthl = "DapLogPoint", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped", {
			text = "▶",
			texthl = "DapStopped",
			linehl = "DapStoppedLine",
			numhl = "",
		})

		local dap = require("dap")

		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = "$CODELLDB_PATH",
				args = { "--port", "${port}" },
			},
		}

		local codelldb_cfg = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		dap.configurations.c = codelldb_cfg
		dap.configurations.cpp = codelldb_cfg
		dap.configurations.rust = codelldb_cfg
		dap.configurations.zig = codelldb_cfg

		dap.configurations.java = {
			{ type = "java", request = "launch", name = "Launch" },
			{ type = "java", request = "attach", name = "Attach", hostName = "127.0.0.1", port = 5005 },
		}

	end,
}
