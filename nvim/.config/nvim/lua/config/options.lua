-- Number and Relative Number
vim.o.number = true
vim.o.relativenumber = true

-- Avoid Line Wrap
vim.o.wrap = false

-- Scroll Off
vim.o.scrolloff = 10
vim.o.sidescrolloff = 8

-- Indentation
vim.o.tabstop = 2 -- Tab width
vim.o.shiftwidth = 2 -- Indent width
vim.o.softtabstop = 2 -- Soft tab stop
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.autoindent = true -- Auto indentation
vim.o.smartindent = true -- Smart indentation

-- Search
vim.o.ignorecase = true -- Case insensitive search
vim.o.smartcase = true -- Case sensitive if uppercase in search
vim.o.incsearch = true -- Show matches as you type

-- File Handling
vim.o.backup = false -- Don't create backup files
vim.o.writebackup = false -- Don't create backup before writing
vim.o.swapfile = false -- Don't create swap files
vim.o.undofile = true -- Persistent undo
vim.o.autoread = true -- Auto reload files changed outside vim
vim.o.autowrite = false -- Don't auto save

-- Behaviors
vim.o.autochdir = false -- Don't auto change directory
vim.o.clipboard = "unnamedplus" -- Use systems clipboard
vim.o.encoding = "UTF-8" -- Set encoding

-- Visual
vim.o.termguicolors = true -- Enable 24-bit colors
vim.o.showmatch = true -- Highlight matching brackets
vim.o.matchtime = 2 -- How long to show matching brackets

-- Theme and Transparency
vim.cmd.colorscheme("habamax")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
