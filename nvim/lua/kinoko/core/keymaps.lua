vim.g.mapleader = " "

local keymap = vim.keymap --for conciseness

--general keymaps

keymap.set("i", "jk", "<ESC>")

keymap.set("n", "<leader>l", ":nohl<CR>")

keymap.set("n", "x", "_x")

-- increment/decrement numbers
keymap.set("n", "+", "<C-a>") -- increment
keymap.set("n", "-", "<C-x>") -- decrement

-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w") --split window horizontally
keymap.set("n", "sv", ":vsplit<Return><C-w>w") -- split window vertically
keymap.set("n", "sx", ":close<CR>") -- close current split window

-- New tab
keymap.set("n", "tt", ":tabnew<CR>") --open newtab
keymap.set("n", "tx", ":tabclose<CR>") -- close current tab

-- Vim maximizer
keymap.set("n", "sm", ":MaximizerToggle<CR>") -- toggle split window maximization

--nvim-tree
keymap.set("n", "e", ":NvimTreeToggle<CR>")

--telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
-- keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>") -- live grep with args
