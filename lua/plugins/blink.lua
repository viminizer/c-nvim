return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets", "moyiz/blink-emoji.nvim" },

	version = "v1.1.1",
	opts = {
		keymap = { preset = "enter" },
		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 150, window = {
				winblend = 100,
			} },
		},
		signature = { enabled = true },
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			providers = {
				emoji = {
					module = "blink-emoji",
					name = "Emoji",
					score_offset = 15, -- Tune by preference
					opts = { insert = true }, -- Insert emoji (default) or complete its name
					should_show_items = function()
						return vim.tbl_contains({ "gitcommit", "markdown" }, vim.o.filetype)
					end,
				},
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning", prebuilt_binaries = { force_version = "v1.1.1" } },
	},
	opts_extend = { "sources.default" },
}
