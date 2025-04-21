return {
	"folke/which-key.nvim",
	opts = {
		preset = "helix",
		delay = 200,
	},
	event = "VeryLazy",
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
