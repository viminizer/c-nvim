return {
	"ibhagwan/fzf-lua",
	dependencies = { "echasnovski/mini.icons" },
	opts = {},
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find Files in CWD",
		},
		{
			"<leader>fc",
			function()
				require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find in Neovim Configuration",
		},
		{
			"<leader>sg",
			function()
				require("fzf-lua").live_grep_native()
			end,
			desc = "Regex/Fuzzy find in Project Directory",
		},
		{
			"<leader>sb",
			function()
				require("fzf-lua").builtin()
			end,
			desc = "[s]earch [b]uilt-in commands",
		},
		{
			"<leader>sw",
			function()
				require("fzf-lua").grep_cword()
			end,
			desc = "[s]earch current [w]ord",
		},
		{
			"<leader>sW",
			function()
				require("fzf-lua").grep_cWORD()
			end,
			desc = "[s]earch current [W]ORD",
		},
		{
			"<leader>sd",
			function()
				require("fzf-lua").diagnostics_document()
			end,
			desc = "[s]earch [d]iagnostics",
		},
		{
			"<leader>sc",
			function()
				require("fzf-lua").colorschemes()
			end,
			desc = "[s]earch [c]olorschemes",
		},
		{
			"<leader><leader>",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "List Buffers",
		},
		{
			"<leader>/",
			function()
				require("fzf-lua").lgrep_curbuf()
			end,
			desc = "Live grep current buffer",
		},
	},
}
