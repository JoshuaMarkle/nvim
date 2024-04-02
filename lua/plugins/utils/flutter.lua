return {
	-- Flutter support
	{
		'akinsho/flutter-tools.nvim',
		enabled = enableFlutter,
		lazy = false,
		dependencies = {
			'nvim-lua/plenary.nvim',
			'stevearc/dressing.nvim',
		},
		keys = {
			{ "<leader>fs", "<cmd>FlutterRun<CR>", desc = "Start" },
			{ "<leader>fr", "<cmd>FlutterReload<CR>", desc = "Reload" },
			{ "<leader>fR", "<cmd>FlutterRestart<CR>", desc = "Restart" },
			{ "<leader>fd", "<cmd>FlutterDevices<CR>", desc = "Devices" },
			{ "<leader>fc", "<cmd>FlutterLogClear<CR>", desc = "Clear Logs" },
			{ "<leader>fo", "<cmd>FlutterOutlineToggle<CR>", desc = "Outline" },
			{ "<leader>fq", "<cmd>FlutterQuit<CR>", desc = "Quit" },
			{ "<leader>fv", "<cmd>FlutterVisualDebug<CR>", desc = "Visual Debug" },

			{ "<leader>fpg", "<cmd>FlutterPubGet<CR>", desc = "Pub Get" },
			{ "<leader>fgu", "<cmd>FlutterPubUpgrade<CR>", desc = "Pub Upgrade" },
		},
		config = function()
			require("flutter-tools").setup {
				ui = {
					border = "rounded",
					notification_style = 'native'
				},
				-- debugger = { -- integrate with nvim dap + install dart code debugger
				-- 	enabled = false,
				-- 	run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
				-- 	-- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
				-- 	-- see |:help dap.set_exception_breakpoints()| for more info
				-- 	exception_breakpoints = {}
				-- 	register_configurations = function(paths)
				-- 		require("dap").configurations.dart = {
				-- 			<put here config that you would find in .vscode/launch.json>
				-- 		}
				-- 	end,
				-- },
				-- flutter_path = "<full/path/if/needed>", -- <-- this takes priority over the lookup
				-- flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
				-- root_patterns = { ".git", "pubspec.yaml" }, -- patterns to find the root of your flutter project
				-- fvm = false, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
				-- widget_guides = {
				-- 	enabled = false,
				-- },
				-- closing_tags = {
				-- 	highlight = "ErrorMsg", -- highlight for the closing tag
				-- 	prefix = ">", -- character to use for close tag e.g. > Widget
				-- 	enabled = true -- set to false to disable
				-- },
				-- dev_log = {
				-- 	enabled = true,
				-- 	notify_errors = false, -- if there is an error whilst running then notify the user
				-- 	open_cmd = "tabedit", -- command to use to open the log buffer
				-- },
				-- dev_tools = {
				-- 	autostart = false, -- autostart devtools server if not detected
				-- 	auto_open_browser = false, -- Automatically opens devtools in the browser
				-- },
				-- outline = {
				-- 	open_cmd = "30vnew", -- command to use to open the outline buffer
				-- 	auto_open = false -- if true this will open the outline automatically when it is first populated
				-- },
				-- lsp = {
				-- 	color = { -- show the derived colours for dart variables
				-- 		enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
				-- 		background = false, -- highlight the background
				-- 		background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
				-- 		foreground = false, -- highlight the foreground
				-- 		virtual_text = true, -- show the highlight using virtual text
				-- 		virtual_text_str = "■", -- the virtual text character to highlight
				-- 	},
				-- 	on_attach = my_custom_on_attach,
				-- 	capabilities = my_custom_capabilities -- e.g. lsp_status capabilities
				-- 	--- OR you can specify a function to deactivate or change or control how the config is created
				-- 	capabilities = function(config)
				-- 		config.specificThingIDontWant = false
				-- 		return config
				-- 	end,
				-- 	-- see the link below for details on each option:
				-- 	-- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
				-- 	settings = {
				-- 		showTodos = true,
				-- 		completeFunctionCalls = true,
				-- 		analysisExcludedFolders = {"<path-to-flutter-sdk-packages>"},
				-- 		renameFilesWithClasses = "prompt", -- "always"
				-- 		enableSnippets = true,
				-- 		updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
				-- 	}
				-- }
			}
		end,
	},

	-- Flutter LSP
	{
		'natebosch/vim-lsc',
		enabled = enableFlutter and enableLsp,
	},

	{
		'natebosch/vim-lsc-dart',
		enabled = enableFlutter and enableLsp,
	},
}
