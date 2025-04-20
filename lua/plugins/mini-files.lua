return {
	"echasnovski/mini.files",
	version = false,
	opts = {
		mappings = {
			close = "q",
			go_in = "l",
			go_in_plus = "<CR>",
			go_out = "H",
			go_out_plus = "h",
			mark_goto = "'",
			mark_set = "m",
			reset = "<BS>",
			reveal_cwd = "@",
			show_help = "g?",
			synchronize = "=",
			trim_left = "<",
			trim_right = ">",
		},
	},
	keys = {
		{
			"<leader>e",
			function()
				require("mini.files").open(vim.fn.getcwd())
			end,
			desc = "Explorer MiniFiles (Root Dir)",
		},
	},
}
