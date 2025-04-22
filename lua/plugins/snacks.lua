return {
	"folke/snacks.nvim",
	opts = {
		dashboard = {
			preset = {
				header = [[
██╗   ██╗██╗███╗   ███╗██╗███╗   ██╗██╗███████╗███████╗██████╗ 
██║   ██║██║████╗ ████║██║████╗  ██║██║╚══███╔╝██╔════╝██╔══██╗
██║   ██║██║██╔████╔██║██║██╔██╗ ██║██║  ███╔╝ █████╗  ██████╔╝
╚██╗ ██╔╝██║██║╚██╔╝██║██║██║╚██╗██║██║ ███╔╝  ██╔══╝  ██╔══██╗
 ╚████╔╝ ██║██║ ╚═╝ ██║██║██║ ╚████║██║███████╗███████╗██║  ██║
  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝╚══════╝╚══════╝╚═╝  ╚═╝
]],
          -- stylua: ignore
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua require('fzf-lua').files()" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua require('fzf-lua').live_grep_native()" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua require('fzf-lua').oldfiles()" },
            { icon = " ", key = "c", desc = "Config", action = ":lua require('fzf-lua').files({ cwd = vim.fn.stdpath('config') })" },
            { icon = " ", key = "s", desc = "Restore SessioN", section = "session" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
			},
		},
	},
}
