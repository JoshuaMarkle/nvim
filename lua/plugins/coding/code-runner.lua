-- Runs all types of code with <Leader>r

return {
	"CRAG666/code_runner.nvim",
	lazy = true,
	cmd = "RunCode",
	config = true,
	keys = {
		{ "<leader>r", "<CMD>RunCode<CR>", desc = "RunCode" },
		{ "<leader>rc", "<CMD>RunCode close<CR>", desc = "RunCode Close" },
	}
}
