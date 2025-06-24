local add, later = MiniDeps.add, MiniDeps.later

later(function()
	add({
		source = "ThePrimeagen/harpoon",
		checkout = "harpoon2",
		depends = { "nvim-lua/plenary.nvim" },
	})
	local harpoon = require("harpoon")
	harpoon.setup()

	vim.keymap.set("n", "<space>hh", function()
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end, { desc = "Show harpoon list" })

	vim.keymap.set("n", "<C-n>", function()
		harpoon:list():select(1)
	end)
	vim.keymap.set("n", "<C-e>", function()
		harpoon:list():select(2)
	end)
	vim.keymap.set("n", "<C-i>", function()
		harpoon:list():select(3)
	end)
	vim.keymap.set("n", "<C-o>", function()
		harpoon:list():select(4)
	end)
	vim.keymap.set("n", "<leader>hn", function()
		harpoon:list():replace_at(1)
	end, { desc = "Repleace harpoon N" })
	vim.keymap.set("n", "<leader>he", function()
		harpoon:list():replace_at(2)
	end, { desc = "Repleace harpoon E" })
	vim.keymap.set("n", "<leader>hi", function()
		harpoon:list():replace_at(3)
	end, { remap = true, desc = "Repleace harpoon I" })
	vim.keymap.set("n", "<leader>ho", function()
		harpoon:list():replace_at(4)
	end, { desc = "Repleace harpoon O" })
end)
