-- Leader and Local Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Terminal
vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt.number = false
		vim.opt.relativenumber = false
	end,
})
vim.keymap.set("n", "<leader>cl", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 5)
end)

-- Netrw
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- LSP
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Telescope
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files)
vim.keymap.set("n", "<leader>lg", telescope_builtin.live_grep)

-- Harpoon
local harpoon = require("harpoon")
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

vim.keymap.set("n", "<leader>lf", function()
	toggle_telescope(harpoon:list())
end)
vim.keymap.set("n", "<localleader>lf", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<C-a>", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<C-s>", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<C-z>", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<C-x>", function()
	harpoon:list():select(4)
end)
vim.keymap.set("n", "<C-S-P>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<C-S-N>", function()
	harpoon:list():next()
end)
