return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				compile = true,
				transparent = true,
				overrides = function(colors)
					return {
						["@markup.link.url.markdown_inline"] = { link = "Special" },
						["@markup.link.label.markdown_inline"] = { link = "WarningMsg" },
						["@markup.italic.markdown_inline"] = { link = "Exception" },
						["@markup.raw.markdown_inline"] = { link = "String" },
						["@markup.list.markdown"] = { link = "Function" },
						["@markup.quote.markdown"] = { link = "Error" },
						["@markup.list.checked.markdown"] = { link = "WarningMsg" },
					}
				end,
			})
			vim.cmd("colorscheme kanagawa")
			require("config.highlights")
		end,
		build = function()
			vim.cmd("KanagawaCompile")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false, -- Load immediately
		priority = 1000, -- High priority to apply first
		opts = {
			flavor = "moch",
			transparent_background = true,
			styles = {
				comments = { "bold" },
			},
			interactions = {
				cmp = true,
				nvimtree = true,
				treesitter = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
		},
	},
}
