-- Puts firefox in the browser

return {
    'glacambre/firenvim',
    enabled = true,
    lazy = false,
    build = function()
        vim.fn["firenvim#install"](0)
    end,
    config = function()
		if vim.g.started_by_firenvim then
			vim.g.firenvim_config = {
				globalSettings = {
					alt = 'all',
				},
				localSettings = {
					['.*'] = {
						cmdline = 'neovim',
						priority = 0,
						selector = 'textarea',
						takeover = 'never'
					},
				},
			}

			local function setup_firenvim()
				vim.bo.filetype = 'cpp'
				vim.opt.ruler = false
				vim.opt.showcmd = false
				vim.opt.laststatus = 0
				vim.opt.showtabline = 0
			end

			vim.api.nvim_create_augroup('firenvim', { clear = true })
			vim.api.nvim_create_autocmd('FileType', {
				pattern = 'text',
				callback = setup_firenvim,
				group = 'firenvim',
			})

			-- vim.opt.guifont = 'Roboto Mono:h20'
		end
    end
}
