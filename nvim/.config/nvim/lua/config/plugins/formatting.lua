return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					rust = { "rustfmt" },
					python = { "ruff_fix" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
				formatters = {
					ruff_fix = {
						append_args = function(self, ctx)
							return {
								"--select=B,C,E,F,W,B9",
								"--ignore=E203,E266,E501",
								"--line-length=88",
								"--extend-exclude=static",
							}
						end,
					},
				},
			})
		end,
	},
}
