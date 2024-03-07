return {
	'theprimeagen/harpoon',
	lazy = true,
	event = 'VeryLazy',
	init = function()
		vim.keymap.set('n', '<leader>ha', require('harpoon.mark').add_file, { desc = 'Harpoon Add' })
		vim.keymap.set('n', '<leader>hm', require('harpoon.ui').toggle_quick_menu, { desc = 'Harpoon Menu' })

		vim.keymap.set('n', '<C-h>', function()
			require('harpoon.ui').nav_file(1)
		end, { desc = 'Harpoon File 1' })
		vim.keymap.set('n', '<C-t>', function()
			require('harpoon.ui').nav_file(2)
		end, { desc = 'Harpoon File 2' })
		vim.keymap.set('n', '<C-n>', function()
			require('harpoon.ui').nav_file(3)
		end, { desc = 'Harpoon File 3' })
		vim.keymap.set('n', '<C-s>', function()
			require('harpoon.ui').nav_file(4)
		end, { desc = 'Harpoon File 4' })
	end,
}
