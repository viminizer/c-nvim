return {
	"stevearc/oil.nvim",
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,
	opts = {
		view_options = {
			show_hidden = true,
		},
		float = {
			padding = 0,
			max_width = 120,
			max_height = 30,
			override = function(conf)
				conf.row = 8
				return conf
			end,
		},
		keymaps = {
			["e"] = "actions.close",
		},
	},
}
