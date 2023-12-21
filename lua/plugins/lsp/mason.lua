-- Mason

return {
    "williamboman/mason.nvim",
	event = 'BufReadPre',
	lazy = true,
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
}
