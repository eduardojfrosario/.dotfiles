vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Allows me to drag the selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Maintain the cursor in the middle
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Allows for deleting without copying what I deleted
vim.keymap.set("x", "<leader>p", '"_dP') -- deletes and pastes
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- copying to clipboard
vim.keymap.set("n", "<leader>y", '\"+y')
vim.keymap.set("v", "<leader>y", '\"+y')
vim.keymap.set("n", "<leader>Y", '\"+Y')
vim.keymap.set("v", "<leader>Y", '\"+Y')

-- removes the 'Q' keybinding
vim.keymap.set("n", "Q", "<nop>")

-- formats the entire file
vim.keymap.set("n", "<leader>f", ':lua require("conform").format()<CR>')

-- hop between projects (tmux)
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionnizer<CR>")

-- quick-fixes
vim.keymap.set("n", "<leader>,", vim.lsp.buf.code_action)

-- replaces the selected word (like F2)
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")


-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
