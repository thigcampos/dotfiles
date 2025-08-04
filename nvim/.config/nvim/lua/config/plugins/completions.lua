return {
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",
		version = "*",
		---@module "blink.cmp"
		---@type blink.cmp.config
		opts = {
			keymap = { preset = "super-tab" },
			appearance = {
				use_nvim_cmp_as_default = true,
			},
		},
		opts_extend = { "sources.default" },
	},
}
