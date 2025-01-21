return {
	{
		"thigcampos/apple-colors.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme apple-colors]])
		end,
	},
}
