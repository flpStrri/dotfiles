local add, later = MiniDeps.add, MiniDeps.later

later(function()
	add("stevearc/conform.nvim")

	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
		},
		format_on_save = function(bufnr)
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			-- TODO Disable autoformat for .gitignore files
			return { timeout_ms = 500, lsp_format = "fallback" }
		end,
	})
	vim.api.nvim_create_user_command("FormatDisable", function(args)
		if args.bang then
			vim.b.disable_autoformat = true
		else
			vim.g.disable_autoformat = true
		end
	end, {
		desc = "Disable autoformat-on-save",
		bang = true,
	})
	vim.api.nvim_create_user_command("FormatEnable", function()
		vim.b.disable_autoformat = false
		vim.g.disable_autoformat = false
	end, {
		desc = "Re-enable autoformat-on-save",
	})
end)

later(function()
	if vim.fn.has("nvim-0.11") == 0 then
		return
	end

	add("neovim/nvim-lspconfig")
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(ev)
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
			local opts = function(str)
				return { buffer = ev.buf, desc = str }
			end

			vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("Go to references"))
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
			vim.keymap.set("n", "gY", vim.lsp.buf.type_definition, opts("Go to type definition"))
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
			vim.keymap.set("n", "<space>r", vim.lsp.buf.rename, opts("Rename Symbol"))
			vim.keymap.set({ "n", "v" }, "<space>a", vim.lsp.buf.code_action, opts("Perform code action"))
		end,
	})
	vim.lsp.enable({
		"lua_ls",
	})
end)
