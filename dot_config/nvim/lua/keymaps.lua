vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")

-- vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- find and center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "U", "<cmd>redo<CR>")

vim.keymap.set("n", "<M-h>", "<cmd>silent !run -f -- mise run build")
-- s = ":run-shell-command zellij run -f -- mise run start"
-- l = ":run-shell-command zellij run -f -- mise run lint"
-- L = ":run-shell-command zellij run -f -- mise run lint-fix"
vim.keymap.set("n", "<BS>t", "<cmd>silent !zellij run -f -- mise run test<CR>")
-- T = ":run-shell-command zellij run -f -- mise run test-watch"
--
--
-- LEADER MODE
vim.keymap.set("n", "<leader>p", [["_dP]], { desc = "Paste without yanking" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank selections to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to clipboard" })
vim.keymap.set("n", "<leader>rs", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- [G]O TO MODE
vim.keymap.set("n", "g%", "<nop>")

-- SPACE MODE
vim.keymap.set("n", "Q", "<nop>")

--- [W]INDOW MODE
vim.keymap.set("n", "<leader>wm", ":wincmd h<CR>", { desc = "test" })
vim.keymap.set("n", "<leader>wn", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<leader>we", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<leader>wi", ":wincmd l<CR>", opts)
vim.keymap.set("n", "<leader>wv", "<C-w>v", opts)
vim.keymap.set("n", "<leader>wc", ":close<CR>", opts)
