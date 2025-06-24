local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later
local now_if_args = vim.fn.argc(-1) > 0 and now or later

now_if_args(function()
	add({
		source = "nvim-treesitter/nvim-treesitter",
		hooks = {
			post_checkout = function()
				vim.cmd("TSUpdate")
			end,
		},
	})
	add({
		source = "nvim-treesitter/nvim-treesitter-textobjects",
	})

	add({
		source = "nvim-treesitter/nvim-treesitter-context",
	})

	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"vimdoc",
			"javascript",
			"typescript",
			"lua",
			"python",
			"jsdoc",
			"bash",
			"fish",
			"go",
		},
		sync_install = true,
		auto_install = false,
		indent = { enable = true },

		highlight = {
			enable = true,
			disable = function(lang, buf)
				if lang == "html" then
					return true
				end

				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					vim.notify(
						"File larger than 100KB treesitter disabled for performance",
						vim.log.levels.WARN,
						{ title = "Treesitter" }
					)
					return true
				end
			end,
			additional_vim_regex_highlighting = { "markdown" },
		},
	})
	require("treesitter-context").setup({
		enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
		multiwindow = false, -- Enable multiwindow support.
		max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
		min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
		line_numbers = true,
		multiline_threshold = 20, -- Maximum number of lines to show for a single context
		trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
		mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
		separator = nil, -- Separator between context and content. Should be a single character string, like '-'.
		zindex = 20, -- The Z-index of the context window
		on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
	})
end)
