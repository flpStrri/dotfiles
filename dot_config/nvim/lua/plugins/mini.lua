local now, later = MiniDeps.now, MiniDeps.later

now(function()
	local notify = require("mini.notify")
	notify.setup({})
	vim.notify = notify.make_notify()
end)
now(function()
	require("mini.starter").setup({ header = "Hei! Tervetuloa Neovimiin!" })
end)
now(function()
	require("mini.statusline").setup({ use_icons = false })
end)
later(function()
	require("mini.ai").setup()
end)
later(function()
	require("mini.bracketed").setup()
end)
later(function()
	require("mini.comment").setup()
end)
later(function()
	require("mini.diff").setup()
end)
later(function()
	require("mini.files").setup({ windows = { preview = true } })
	vim.keymap.set("n", "<leader>t", ":lua MiniFiles.open()<CR>", { desc = "Open file tree" })
end)
later(function()
	require("mini.git").setup()
end)
later(function()
	require("mini.jump").setup()
end)
later(function()
	local j = require("mini.jump2d")
	j.setup({
		labels = "tnseriaodh",
		view = { dim = true, n_steps_ahead = 2 },
		mappings = {
			start_jumping = "",
		},
	})
	vim.keymap.set({ "n", "x", "o" }, "gw", function()
		j.start(j.builtin_opts.single_character)
	end, { desc = "Jump to a two-character label" })
end)
later(function()
	require("mini.surround").setup()
	require("mini.splitjoin").setup({ mappings = { toggle = "ss" } })
	vim.keymap.set({ "n", "x" }, "s", "<Nop>")
end)
later(function()
	local miniclue = require("mini.clue")
  --stylua: ignore
  miniclue.setup({
    clues = {
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers(),
      miniclue.gen_clues.windows({ submode_resize = true }),
      miniclue.gen_clues.z(),
            { mode = 'n', keys = '<Leader>h', desc = "Manage Harpoon" },
    },
    triggers = {
      { mode = 'n', keys = '<Leader>' }, -- Leader triggers
      { mode = 'x', keys = '<Leader>'},
      { mode = 'n', keys = [[\]] },      -- mini.basics
      { mode = 'n', keys = '[' },        -- mini.bracketed
      { mode = 'n', keys = ']' },
      { mode = 'x', keys = '[' },
      { mode = 'x', keys = ']' },
      { mode = 'i', keys = '<C-x>' },    -- Built-in completion
      { mode = 'n', keys = 'g' },        -- `g` key
      { mode = 'n', keys = "'" },        -- Marks
      { mode = 'n', keys = '`' },
      { mode = 'x', keys = "'" },
      { mode = 'x', keys = '`' },
      { mode = 'n', keys = '"' },        -- Registers
      { mode = 'x', keys = '"' },
      { mode = 'i', keys = '<C-r>' },
      { mode = 'c', keys = '<C-r>' },
      { mode = 'n', keys = '<C-w>' },    -- Window commands
      { mode = 'n', keys = 'z' },        -- `z` key
      { mode = 'n', keys = 's' },        -- `s` key
      { mode = 'x', keys = 'z' },
    },
  })
end)
later(function()
	local comp = require("mini.completion")
	comp.setup({
		lsp_completion = {
			source_func = "omnifunc",
			auto_setup = false,
		},
	})
	local on_attach = function(args)
		vim.bo[args.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
	end
	vim.api.nvim_create_autocmd("LspAttach", { callback = on_attach })
	vim.lsp.config("*", { capabilities = comp.get_lsp_capabilities() })
end)
later(function()
	local map_multistep = require("mini.keymap").map_multistep
	map_multistep("i", "<Tab>", { "pmenu_next" })
	map_multistep("i", "<S-Tab>", { "pmenu_prev" })
	map_multistep("i", "<CR>", { "pmenu_accept", "minipairs_cr" })
	map_multistep("i", "<BS>", { "minipairs_bs" })
end)
