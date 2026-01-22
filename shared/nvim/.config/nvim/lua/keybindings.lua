local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- remap <Space> as <leader> key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Insert mode:
-- Fast to exit insert mode
keymap("i", "jk", "<Esc>", opts)
keymap("i", "kj", "<Esc>", opts)


-- Normal mode:
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- move next up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)


-- Visual mode:
-- stay in indent mode
keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)

-- move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- text deleted after pasting goes into a "black hole"
keymap("v", "p", '"_dP', opts)


-- Visual Block mode:
-- move text up and down
keymap("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)


-- Commands:
-- skip folds
vim.cmd("nmap j gj")
vim.cmd("nmap k gk")

-- save file
vim.cmd("nmap <leader>s :w<CR>", opts)
