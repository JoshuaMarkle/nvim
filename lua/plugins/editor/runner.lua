-- Runs all types of code with <Leader>r

return {
	'CRAG666/code_runner.nvim',
	lazy = true,
	cmd = 'RunCode',
	config = true,
	keys = {
		-- Run code; opens a new terminal if needed
		-- vim.keymap.set({ 'n' }, '<leader>tr', function()
		-- 	local terminals = require("toggleterm.terminal").get_all()
		-- 	local code_runner_command = require('code_runner.commands').get_filetype_command():gsub('"', '\\"')
		-- 	if #terminals == 0 then
		-- 		vim.cmd("ToggleTerm size=60 direction=vertical name=toggleterm")
		-- 	end
		-- 	vim.cmd("update")
		-- 	vim.cmd('TermExec cmd="' .. code_runner_command .. '"')
		-- end, { desc = 'Run Code In Terminal' }),
		vim.keymap.set({ 'n' }, '<leader>c', function()
			local code_runner_command = require('code_runner.commands').get_filetype_command()
			if not code_runner_command then
				print("No code runner command found for this filetype")
				return
			end
			local escaped_command = code_runner_command:gsub("'", "'\\''")
			local shell_cmd = "pypr show term && tmux send-keys -t codeforces '" .. "clear && " .. escaped_command .. "' Enter"
			vim.fn.jobstart({ 'sh', '-c', shell_cmd })
		end, { desc = 'Run Code' })
	},
	opts = {
		-- choose default mode (valid term, tab, float, toggle)
		mode = 'term',
		-- Focus on runner window(only works on toggle, term and tab mode)
		focus = true,
		-- startinsert (see ':h inserting-ex')
		startinsert = false,
		insert_prefix = '',
		term = {
			close_key = '<ESC>',
			--  Position to open the terminal, this option is ignored if mode ~= term
			position = 'bot',
			-- window size, this option is ignored if mode == tab
			size = 20,
		},
		float = {
			close_key = '<ESC>',
			-- Window border (see ':h nvim_open_win')
			border = 'rounded',

			-- Num from `0 - 1` for measurements
			height = 0.8,
			width = 0.8,
			x = 0.5,
			y = 0.5,

			-- Highlight group for floating window/border (see ':h winhl')
			border_hl = 'FloatBorder',
			float_hl = 'Normal',

			-- Transparency (see ':h winblend')
			blend = 0,
		},
		better_term = { -- Toggle mode replacement
			clean = false, -- Clean terminal before launch
			number = 10, -- Use nil for dynamic number and set init
			init = nil,
		},
		filetype_path = '',
		-- Execute before executing a file
		before_run_filetype = function()
			vim.cmd ':w'
		end,
		filetype = {
			javascript = 'node',
			java = {
				'cd $dir &&',
				'javac $fileName &&',
				'java $fileNameWithoutExt',
			},
			c = {
				'cd $dir &&',
				'gcc $fileName',
				'-o $fileNameWithoutExt &&',
				'$dir/$fileNameWithoutExt',
			},
			cpp = {
				'cd $dir &&',
				'g++ $fileName',
				'-o $fileNameWithoutExt &&',
				'$dir/$fileNameWithoutExt',
			},
			python = 'python -u',
			sh = 'bash',
			rust = {
				'cd $dir &&',
				'rustc $fileName &&',
				'$dir/$fileNameWithoutExt',
			},
		},
		project_path = '',
		project = {},
		prefix = '',
	},
}
