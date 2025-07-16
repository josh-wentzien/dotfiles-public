-- the setup for the colorscheme --
return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			-- local is_dark = vim.fn.filereadable(vim.fn.expand("~/.config/nvim/.nvim_theme_dark")) == 1

			require("catppuccin").setup({
				-- flavour = is_dark and "mocha" or "latte",
        flavour = "mocha"
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
