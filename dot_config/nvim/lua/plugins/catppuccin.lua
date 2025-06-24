local add, now = MiniDeps.add, MiniDeps.now

now(function()
	add("catppuccin/nvim")
      vim.cmd.colorscheme "catppuccin"
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end)
