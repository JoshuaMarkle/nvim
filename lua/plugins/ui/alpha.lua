-- Add a dashboard on open

return {
    'goolord/alpha-nvim',
    enabled = true,
    lazy = false,
	keys = {
		{ "<leader>a", "<cmd>Alpha<CR>", desc = "Home" },
	},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require('alpha')

		local path_ok, plenary_path = pcall(require, "plenary.path")
		if not path_ok then
			return
		end

		local dashboard = require("alpha.themes.dashboard")
		local cdir = vim.fn.getcwd()
		local if_nil = vim.F.if_nil

		local nvim_web_devicons = {
			enabled = true,
			highlight = true,
		}

		local function get_extension(fn)
			local match = fn:match("^.+(%..+)$")
			local ext = ""
			if match ~= nil then
				ext = match:sub(2)
			end
			return ext
		end

		local function icon(fn)
			local nwd = require("nvim-web-devicons")
			local ext = get_extension(fn)
			return nwd.get_icon(fn, ext, { default = true })
		end

		local function file_button(fn, sc, short_fn,autocd)
			short_fn = short_fn or fn
			local ico_txt
			local fb_hl = {}

			if nvim_web_devicons.enabled then
				local ico, hl = icon(fn)
				local hl_option_type = type(nvim_web_devicons.highlight)
				if hl_option_type == "boolean" then
					if hl and nvim_web_devicons.highlight then
						table.insert(fb_hl, { hl, 0, #ico })
					end
				end
				if hl_option_type == "string" then
					table.insert(fb_hl, { nvim_web_devicons.highlight, 0, #ico })
				end
				ico_txt = ico .. "  "
			else
				ico_txt = ""
			end
			local cd_cmd = (autocd and " | cd %:p:h" or "")
			local file_button_el = dashboard.button(sc, ico_txt .. short_fn, "<cmd>e " .. vim.fn.fnameescape(fn) .. cd_cmd .." <CR>")
			local fn_start = short_fn:match(".*[/\\]")
			if fn_start ~= nil then
				table.insert(fb_hl, { "Comment", #ico_txt - 2, #fn_start + #ico_txt })
			end
			file_button_el.opts.hl = fb_hl
			return file_button_el
		end

		local default_mru_ignore = { "gitcommit" }

		local mru_opts = {
			ignore = function(path, ext)
				return (string.find(path, "COMMIT_EDITMSG")) or (vim.tbl_contains(default_mru_ignore, ext))
			end,
			autocd = false
		}

		local function mru(start, cwd, items_number, opts)
			opts = opts or mru_opts
			items_number = if_nil(items_number, 10)

			local oldfiles = {}
			for _, v in pairs(vim.v.oldfiles) do
				if #oldfiles == items_number then
					break
				end
				local cwd_cond
				if not cwd then
					cwd_cond = true
				else
					cwd_cond = vim.startswith(v, cwd)
				end
				local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
				if (vim.fn.filereadable(v) == 1) and cwd_cond and not ignore then
					oldfiles[#oldfiles + 1] = v
				end
			end
			local target_width = 35

			local tbl = {}
			for i, fn in ipairs(oldfiles) do
				local short_fn
				if cwd then
					short_fn = vim.fn.fnamemodify(fn, ":.")
				else
					short_fn = vim.fn.fnamemodify(fn, ":~")
				end

				if #short_fn > target_width then
					short_fn = plenary_path.new(short_fn):shorten(1, { -2, -1 })
					if #short_fn > target_width then
						short_fn = plenary_path.new(short_fn):shorten(1, { -1 })
					end
				end

				local shortcut = tostring(i + start - 1)

				local file_button_el = file_button(fn, shortcut, short_fn,opts.autocd)
				tbl[i] = file_button_el
			end
			return {
				type = "group",
				val = tbl,
				opts = {},
			}
		end

		local header = {
			type = "text",
			val = {
				-- [[                                  __]],
				-- [[     ___     ___    ___   __  __ /\_\    ___ ___]],
				-- [[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\]],
				-- [[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \]],
				-- [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
				-- [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],

-- [[ 		    .                                                      .]],
-- [[        .n                   .                 .                  n.]],
-- [[  .   .dP                  dP                   9b                 9b.    .]],
-- [[ 4    qXb         .       dX                     Xb       .        dXp     t]],
-- [[dX.    9Xb      .dXb    __                         __    dXb.     dXP     .Xb]],
-- [[9XXb._       _.dXXXXb dXXXXbo.                 .odXXXXb dXXXXb._       _.dXXP]],
-- [[ 9XXXXXXXXXXXXXXXXXXXVXXXXXXXXOo.           .oOXXXXXXXXVXXXXXXXXXXXXXXXXXXXP]],
-- [[  `9XXXXXXXXXXXXXXXXXXXXX'~   ~`OOO8b   d8OOO'~   ~`XXXXXXXXXXXXXXXXXXXXXP']],
-- [[    `9XXXXXXXXXXXP' `9XX'          `98v8P'          `XXP' `9XXXXXXXXXXXP']],
-- [[        ~~~~~~~       9X.          .db|db.          .XP       ~~~~~~~]],
-- [[                        )b.  .dbo.dP'`v'`9b.odb.  .dX(]],
-- [[                      ,dXXXXXXXXXXXb     dXXXXXXXXXXXb.]],
-- [[                     dXXXXXXXXXXXP'   .   `9XXXXXXXXXXXb]],
-- [[                    dXXXXXXXXXXXXb   d|b   dXXXXXXXXXXXXb]],
-- [[                    9XXb'   `XXXXXb.dX|Xb.dXXXXX'   `dXXP]],
-- [[                     `'      9XXXXXX(   )XXXXXXP      `']],
-- [[                              XXXX X.`v'.X XXXX]],
-- [[                              XP^X'`b   d'`X^XX]],
-- [[                              X. 9  `   '  P )X]],
-- [[                              `b  `       '  d']],

[[              $$ $$$$$ $$]],
[[              $$ $$$$$ $$]],
[[             .$$ $$$$$ $$.]],
[[             :$$ $$$$$ $$:]],
[[             $$$ $$$$$ $$$]],
[[             $$$ $$$$$ $$$]],
[[            ,$$$ $$$$$ $$$.]],
[[           ,$$$$ $$$$$ $$$$.]],
[[          ,$$$$; $$$$$ :$$$$.]],
[[         ,$$$$$  $$$$$  $$$$$.]],
[[       ,$$$$$$'  $$$$$  `$$$$$$.]],
[[     ,$$$$$$$'   $$$$$   `$$$$$$$.]],
[[  ,s$$$$$$$'     $$$$$     `$$$$$$$s.]],
[[$$$$$$$$$'       $$$$$       `$$$$$$$$$]],
[[$$$$$Y'          $$$$$          `Y$$$$$]],

-- [[      ~+]],
-- [[                 *       +]],
-- [[           '                  |]],
-- [[       ()    .-.,="``"=.    - o -]],
-- [[             '=/_       \     |]],
-- [[          *   |  '=._    |]],
-- [[               \     `=./`,        ']],
-- [[            .   '=.__.=' `='      *]],
-- [[   +                         +]],
-- [[        O      *        '       .]],
			},
			opts = {
				position = "center",
				hl = "Function",
				-- wrap = "overflow";
			},
		}

		local section = {
			type = "group",
			val = {
				{
					type = "text",
					val = "Recent files",
					opts = {
						hl = "Function",
						shrink_margin = false,
						position = "center",
					},
				},
				{ type = "padding", val = 1 },
				{
					type = "group",
					val = function()
						return { mru(0, cdir) }
					end,
					opts = { shrink_margin = false },
				},
			},
		}

		local buttons = {
			type = "group",
			val = {
				{ type = "text", val = "Quick links", opts = { hl = "Function", position = "center" } },
				{ type = "padding", val = 1 },
				dashboard.button("e", "  New file", "<cmd>ene<CR>"),
				dashboard.button("f", "󰈞  Find file", "<cmd>Telescope find_files<CR>"),
				dashboard.button("c", "  Configuration", "<cmd>cd ~/.config/nvim/<CR>"),
				dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<cr>"),
				dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
			},
			position = "center",
		}

        -- Define a footer section for the dashboard
        local footer = {
            type = "text",
            val = "",
            opts = {
                position = "center",
                hl = "Comment"
            }
        }

		local config = {
			layout = {
				{ type = "padding", val = 1 },
				header,
				{ type = "padding", val = 2 },
				section,
				{ type = "padding", val = 1 },
				buttons,
				{ type = "padding", val = 2 },
				footer,
			},
			opts = {
				margin = 5,
				setup = function()
					vim.api.nvim_create_autocmd('DirChanged', {
						pattern = '*',
						group = "alpha_temp",
						callback = function ()
							require('alpha').redraw()
							vim.cmd('AlphaRemap')
						end,
					})
				end,
			},
		}

		alpha.setup(config)

        -- Add a startup time
        vim.api.nvim_create_autocmd("User", {
            once = true,
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                local startup_message = "⚡ Neovim loaded in " .. ms .. "ms"

                -- Update the footer section with the startup message
                footer.val = startup_message
                alpha.redraw()
            end,
        })
    end,
}
