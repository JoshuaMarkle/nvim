return {
	'theprimeagen/harpoon',
	keys = {
		{ '<leader>ha', "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = 'Add File To Harpoon' },
		{ '<leader>hm', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = 'Harpoon Menu' },
		{ 'C-h', [[lua require("harpoon.ui").nav_file(0)]], mode = { 'n', 'x' }, desc = "Navigate Next" },
		{ 'C-t', [[lua require("harpoon.ui").nav_file(1)]], mode = { 'n', 'x' }, desc = "Navigate Previous"},
		{ 'C-n', [[lua require("harpoon.ui").nav_file(2)]], mode = { 'n', 'x' }, desc = "Navigate Next" },
		{ 'C-s', [[lua require("harpoon.ui").nav_file(3)]], mode = { 'n', 'x' }, desc = "Navigate Previous"},
	},
	lazy = true,
}
