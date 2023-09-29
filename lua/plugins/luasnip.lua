local ls = require("luasnip")

-- Define a function that returns the current date in the format YYYY-MM-DD
local date = function() return {os.date('%Y-%m-%d')} end

-- Define the snippet
local mySnippet = ls.snippet({
    trig = "date",
    name = "Date",
    desc = "Date in the form of YYYY-MM-DD",
}, {
    ls.function_node(date, {}),
})

-- Add the snippet to the specific file type (e.g., LaTeX)
ls.add_snippets("tex", {
    mySnippet,
})

vim.api.nvim_set_keymap("i", "<Tab>", "<cmd>lua require('luasnip').expand_or_jump()<CR>", { silent = true, expr = true })
