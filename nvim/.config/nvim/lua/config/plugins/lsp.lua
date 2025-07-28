return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lspconfig").sourcekit.setup({
				capabilities = {
					workspace = {
						didChangeWatchedFiles = {
							dynamicRegistration = true,
						},
					},
				},
			})
			-- setups are in plugins/mason.lua
			-- needed while not in neovim nightly
			vim.keymap.set("n", "grn", vim.lsp.buf.rename)
			vim.keymap.set("n", "gra", vim.lsp.buf.code_action)
			vim.keymap.set("n", "grr", vim.lsp.buf.references)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition)
			vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help)

			-- formatting
			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format()
			end)
		end,
	},
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("williamboman/mason-lspconfig.nvim").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
			})
		end,
	},
}
