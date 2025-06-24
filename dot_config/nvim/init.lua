local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/echasnovski/mini.nvim",
		mini_path,
	}
	vim.fn.system(clone_cmd)
	vim.cmd("packadd mini.nvim | helptags ALL")
	vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require("mini.deps").setup({ path = { package = path_package } })
MiniDeps.add({ name = "mini.nvim", checkout = "stable" })

require("keymaps")
require("options")
require("plugins.catppuccin")
require("plugins.mini")
require("plugins.fzf")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.harpoon")

vim.keymap.set("n", "<C-i>", ':echo "Ctrl+I pressed"<CR>', { desc = "Custom Ctrl+I" })
-- vim.keymap.set("n", "<Tab>", ':echo "Tab pressed"<CR>', { desc = "Custom Tab" })
