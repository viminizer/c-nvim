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
			"<leader>fm",
			function()
				local filepath = vim.api.nvim_buf_get_name(0)
				if filepath == "" then
					return
				end -- handle empty buffers
				local directory = vim.fn.fnamemodify(filepath, ":p:h")
				require("mini.files").open(directory, true)
			end,
			desc = "Explorer MiniFiles",
		},
	},
}
