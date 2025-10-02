return {
	"wojciech-kulik/xcodebuild.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		-- plugin setup (pass options here if you need to configure it)
		require("xcodebuild").setup({
			show_build_progress_bar = false,
			code_coverage = { enabled = true },
			-- you can add other plugin options here if needed
		})
	end,
}
