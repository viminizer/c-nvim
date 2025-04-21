return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	opts = {
		views = {
			notify = {
				timeout = 2000,
				size = {
					max_width = 50,
				},
			},
			cmd_popup = {
				border = {
					style = "rounded",
					padding = { 1, 2 },
				},
				win_options = {
					winhighlight = "NormalFloat:NoiceCmdlineNormal,FloatBorder:NoiceCmdlineBorder",
				},
			},
			popup = {
				backend = "popup",
				relative = "editor",
				position = {
					row = "50%",
					col = "50%",
				},
				size = {
					width = 100,
					height = 20,
				},
				border = {
					style = "rounded",
				},
				win_options = {
					winblend = 100,
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
				},
			},
		},
		commands = {
			history = {
				view = "popup",
			},
			all = {
				view = "popup",
			},
		},
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		routes = {
			{
				view = "notify",
				filter = { event = "msg_showmode" },
			},
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "%d+L, %d+B" },
						{ find = "; after #%d+" },
						{ find = "; before #%d+" },
					},
				},
				view = "mini",
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
		},
	},
	keys = {
		{
			"<leader>nl",
			function()
				require("noice").cmd("last")
			end,
			desc = "Noice Last Message",
		},
		{
			"<leader>nh",
			function()
				require("noice").cmd("history")
			end,
			desc = "Noice History",
		},
		{
			"<leader>na",
			function()
				require("noice").cmd("all")
			end,
			desc = "Noice All",
		},
		{
			"<leader>nd",
			function()
				require("noice").cmd("dismiss")
			end,
			desc = "Dismiss All",
		},
	},
	config = function(_, opts)
		if vim.o.filetype == "lazy" then
			vim.cmd([[messages clear]])
		end
		require("noice").setup(opts)
	end,
}
