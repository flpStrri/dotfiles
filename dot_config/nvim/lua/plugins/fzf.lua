local add, later = MiniDeps.add, MiniDeps.later

later(function()
	add("ibhagwan/fzf-lua")
	local fzf = require("fzf-lua")
	fzf.setup({
		"border-fused",
		fzf_opts = { ["--wrap"] = true },
		keymap = {
			builtin = {
				false,
				["<C-d>"] = "preview-page-down",
				["<C-u>"] = "preview-page-up",
			},
		},
	})
	vim.keymap.set("n", "<leader>f", fzf.files, { desc = "Open file picker" })
	vim.keymap.set("n", "<leader>b", fzf.buffers, { desc = "Open buffer picker" })
	vim.keymap.set("n", "<leader>g", fzf.git_status, { desc = "Open changed files picker" })
	vim.keymap.set("n", "<leader>/", fzf.live_grep, { desc = "Global search in workspace" })
	vim.keymap.set("n", "<leader>d", fzf.diagnostics_document, { desc = "Open diagnostic picker" })
	vim.keymap.set("n", "<leader>D", fzf.diagnostics_workspace, { desc = "Open workspace diagnostic picker" })
end)
