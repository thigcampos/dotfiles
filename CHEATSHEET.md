# NeoVim's CheatSheet

### Mapleader
```lua
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
```

### Builtin Terminal  
```lua
vim.keymap.set("n", "<leader>cl")
```

### Telescope  
```lua
vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files)
vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep)
```

### Harpoon  
```lua
vim.keymap.set("n", "<C-e>", toggle_telescope(harpoon:list())
vim.keymap.set("n", "<leader>a", harpoon:list():add())
vim.keymap.set("n", "<C-a>", harpoon:list():select(1))
vim.keymap.set("n", "<C-s>", harpoon:list():select(2))
vim.keymap.set("n", "<C-z>", harpoon:list():select(3))
vim.keymap.set("n", "<C-x>", harpoon:list():select(4))
vim.keymap.set("n", "<C-S>", harpoon:list():prev())
vim.keymap.set("n", "<C-W", harpoon:list():next())
```
