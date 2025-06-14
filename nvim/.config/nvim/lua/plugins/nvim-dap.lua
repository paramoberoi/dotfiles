return {
	"mfussenegger/nvim-dap",
	dependencies = {
		-- ui plugins to make debugging simplier
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		-- gain access to the dap plugin and its functions
		local dap = require("dap")
		-- gain access to the dap ui plugin and its functions
		local dapui = require("dapui")
		local dapvtext = require("nvim-dap-virtual-text")

		-- Setup the dap ui with default configuration
		dapui.setup()

		-- setup an event listener for when the debugger is launched
		dap.listeners.before.launch.dapui_config = function()
			-- when the debugger is launched open up the debug ui
			dapui.open()
		end

		-- Setup virtual text for dap
		dapvtext.setup()

		-- Toggle a basic breakpoint at current line
		vim.keymap.set("n", "<leader>bb", dap.toggle_breakpoint, { desc = "[B]reakpoint [B]asic" })

		-- Set a conditional breakpoint at current line
		vim.keymap.set("n", "<leader>bc", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "[B]reakpoint [C]onditional" })

		-- Set a logpoint at current line that prints a message when hit
		vim.keymap.set("n", "<leader>bl", function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end, { desc = "[B]reakpoint [L]og" })

		-- Remove all breakpoints
		vim.keymap.set("n", "<leader>br", dap.clear_breakpoints, { desc = "[B]reakpoint [R]emove all" })

		-- Start or continue debugging session
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "[D]ebug [C]ontinue" })

		-- Step over - execute current line and stop at next line
		vim.keymap.set("n", "<leader>dj", dap.step_over, { desc = "[D]ebug Step [J]ump over" })

		-- Step into - step into function call on current line
		vim.keymap.set("n", "<leader>dk", dap.step_into, { desc = "[D]ebug Step Into [K]ode" })

		-- Step out - run until current function returns
		vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "[D]ebug Step [O]ut" })

		-- Toggle debug REPL (Read-Eval-Print Loop)
		vim.keymap.set("n", "<leader>dr", dap.repl.toggle, { desc = "[D]ebug [R]EPL toggle" })

		-- Run last debugging configuration again
		vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "[D]ebug Run [L]ast" })

		-- List all breakpoints using Telescope
		vim.keymap.set("n", "<leader>ba", function()
			require("telescope").extensions.dap.list_breakpoints()
		end, { desc = "[B]reakpoint [A]ll list" })

		-- Disconnect debugger and close UI
		vim.keymap.set("n", "<leader>dd", function()
			dap.disconnect()
			dapui.close()
		end, { desc = "[D]ebug [D]isconnect" })

		-- Terminate debug session and close UI
		vim.keymap.set("n", "<leader>dt", function()
			dap.terminate()
			dapui.close()
		end, { desc = "[D]ebug [T]erminate" })

		-- Show variable values on hover
		vim.keymap.set("n", "<leader>di", function()
			require("dap.ui.widgets").hover()
		end, { desc = "[D]ebug [I]nspect hover" })

		-- Show all scopes and variables in a floating window
		vim.keymap.set("n", "<leader>d?", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.scopes)
		end, { desc = "[D]ebug Scopes [?]" })

		-- Show call stack frames using Telescope
		vim.keymap.set("n", "<leader>df", function()
			require("telescope").extensions.dap.frames()
		end, { desc = "[D]ebug [F]rames" })

		-- Show available debug commands using Telescope
		vim.keymap.set("n", "<leader>dh", function()
			require("telescope").extensions.dap.commands()
		end, { desc = "[D]ebug Commands [H]elp" })

		-- Show diagnostics filtered to errors using Telescope
		vim.keymap.set("n", "<leader>de", function()
			require("telescope.builtin").diagnostics({ default_text = ":E:" })
		end, { desc = "[D]ebug [E]rrors" })
	end,
}
