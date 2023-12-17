return {
	'gelguy/wilder.nvim',
	enabled = false;
	config = function()
		local wilder = require('wilder')
		wilder.setup({modes = {':', '/', '?'}})

		wilder.set_option('renderer', wilder.popupmenu_renderer(
			wilder.popupmenu_border_theme({
				highlighter = wilder.basic_highlighter(),
				highlights = {
					default = wilder.make_hl('WilderNormal', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#a0a8b7', background = '#1f2329'}}),
					border = wilder.make_hl('WilderBorder', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#a0a8b7', background = '#1f2329'}}),
					accent = wilder.make_hl('WilderAccent', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#4fa6ed', background = '#1f2329'}}),
				},

				-- Enable icons and disable scroll bar
				left = {' ', wilder.popupmenu_devicons()},
				right = {' '},

				-- 'single', 'double', 'rounded' or 'solid'
				border = 'rounded',
				pumblend = 50,
			})
		))

	end,
}
