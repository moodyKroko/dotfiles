-- current color scheme
return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		opts = {
			flavour = "macchiato",
			transparent_background = true,
			term_colors = true,
			float = {
        transparent = true,
				solid = false,
			},
			-- try to get these working sometime in future
			-- highlights.BlinkCmpMenu = { fg = colors.magenta, bg = colors.none }
			-- highlights.BlinkCmpDoc = { fg = colors.purple, bg = colors.none }
			-- highlights.BlinkCmpMenuBorder = { fg = colors.border_highlight, bg = colors.none }
			-- highlights.BlinkCmpMenuSelection = { bg = colors.bg_highlight }
			auto_integrations = true,
			integrations = {
				blink_cmp = true,
				rainbow_delimiters = true,
				lsp_trouble = true,
			},
		},
	},

	{
		"LazyVim/LazyVim",
		opts = {
			-- colorscheme = "tokyonight",
			colorscheme = "catppuccin-nvim",
		},
	},
}
