-- Add a dashboard on open

return {
    'goolord/alpha-nvim',
    enabled = true,
    lazy = false,
    -- event = "VimEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.theta').config
		
        -- Define a footer section for the dashboard
        local footer = {
            type = "text",
            val = "",
            opts = {
                position = "center",
                hl = "Type"
            }
        }

        -- Add the footer section to the dashboard
		table.insert(dashboard.layout, { type = "padding", val = 2 })
        table.insert(dashboard.layout, footer)
        alpha.setup(dashboard)

        -- Add a startup time
        vim.api.nvim_create_autocmd("User", {
            once = true,
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                local startup_message = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"

                -- Update the footer section with the startup message
                footer.val = startup_message
                alpha.redraw()
            end,
        })
    end,
}
